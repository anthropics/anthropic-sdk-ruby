# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tools
      # @api private
      #
      class Runner
        # Every stop reason falls in exactly one bucket, so a newly generated one has to be
        # classified here before the runner can decide what its turn means.
        #
        # The model asked for client tools: their results go back and the loop continues.
        RUN_TOOLS_STOP_REASONS = Set[:tool_use].freeze
        # Unfinished turns: sent back unchanged, tool calls unrun, so the server continues them.
        RESUME_STOP_REASONS = Set[
          :pause_turn,
          :compaction # pause_after_compaction hands the turn back before the model answers
        ].freeze
        # Terminal turns end the run as its final message. Their tool_use blocks never run:
        # executing a call the model did not finish (e.g. cut off by max_tokens) or refused
        # would fire side effects it never confirmed.
        STOP_STOP_REASONS = Set[
          :end_turn,
          :stop_sequence,
          :max_tokens,
          :model_context_window_exceeded,
          :refusal
        ].freeze
        private_constant :RUN_TOOLS_STOP_REASONS, :RESUME_STOP_REASONS, :STOP_STOP_REASONS

        # @return [Anthropic::Models::Beta::MessageCreateParams]
        attr_reader :params

        # @param params [Anthropic::Models::Beta::MessageCreateParams]
        #
        # @raise [ArgumentError] if `compaction` or `thread` is set, if the messages are replaced while the
        #   conversation is being compacted, or if a compaction edit is added while a compaction is due
        def params=(params)
          # The runner reads and writes its params as a symbol-keyed hash.
          params = params.to_h.transform_keys(&:to_sym)
          reject_compaction_param!(params)
          reject_thread_param!(params)
          if @compaction_phase == :in_flight && !params[:messages].equal?(current_messages)
            raise ArgumentError.new(
              "Message params can't be changed while the conversation is being compacted, because the " \
              "compaction response replaces them. Make the change on the next iteration."
            )
          end
          check_can_compact!(params) if @pending_compaction || @compaction_phase == :in_flight

          @params = params
        end

        # @return [Boolean]
        def finished? = @finished

        # @param messages [Array<Anthropic::Models::Beta::BetaUserMessageParam, Anthropic::Models::Beta::BetaAssistantMessageParam, Anthropic::Models::Beta::BetaSystemMessageParam>]
        def feed_messages(*messages)
          self.params = {**params.to_h, messages: params[:messages].to_a + messages}
        end

        # @api public
        #
        # Sends the tools' definitions in `tool_addition` blocks with the next request, leaving
        # `params[:tools]` and the prompt cache alone. A `BaseTool` is run under its name straight away,
        # replacing a same-name tool even for a call already in the message being handled; a raw
        # definition is never run here and stops a same-name tool from running. Needs the
        # `inline-tools-2026-09-15` beta.
        #
        # @param tools [Array<Anthropic::Helpers::Tools::BaseTool, Anthropic::Models::Beta::BetaToolUnion, Hash{Symbol=>Object}>]
        def add_tools(*tools)
          # Converted in place, so the originals are kept apart to pair each with its definition.
          request = {tools: tools.dup}
          Anthropic::Helpers::Messages.distill_input_schema_models!(request, strict: nil)
          tools.zip(request.fetch(:tools)) do |tool, definition|
            block = {type: :tool_addition, tool: {type: :tool_definition, definition:}}
            runnable = tool if tool.is_a?(Anthropic::Helpers::Tools::BaseTool)
            name = changed_tool_name(block.fetch(:tool))
            @tool_overrides.store(name, runnable) unless name.nil?
            @pending_tool_changes << block
          end
        end

        # @api public
        #
        # Sends `tool_removal` blocks with the next request. The tools stop being run straight away,
        # so a call to one gets the "not found" error result. Needs the `inline-tools-2026-09-15` beta.
        #
        # @param tools [Array<Anthropic::Helpers::Tools::BaseTool, String, Symbol>] the tools, or their names
        def remove_tools(*tools)
          tools.each do |tool|
            name =
              case tool
              in Anthropic::Helpers::Tools::BaseTool
                Anthropic::Helpers::Messages.tool_api_name(tool)
              in String | Symbol
                tool.to_s
              end
            @tool_overrides.store(name, nil)
            @pending_tool_changes << {type: :tool_removal, tool: {type: :tool_reference, name:}}
          end
        end

        # Compact the conversation before the model's next turn. Once the current turn has finished,
        # including any tool calls, the runner asks the API for a summary and replaces its messages with
        # the compaction response, which you get like any other message. Requires the
        # `compact-2026-09-04` beta.
        #
        # @param compaction [Anthropic::Models::Beta::BetaCompactionConfig, Hash{Symbol=>Object}, nil]
        #   the same config `messages.create(compaction:)` takes, `{type: :summarize}` when omitted
        #
        # @raise [ArgumentError] if `context_management` has a compaction edit
        #
        # @return [void]
        def compact_before_next_turn(compaction = nil)
          return unless @compaction_phase.nil?

          check_can_compact!(params)
          @pending_compaction = compaction || {type: :summarize}
        end

        # @return [Array<Anthropic::Models::Beta::BetaUserMessageParam, Anthropic::Models::Beta::BetaAssistantMessageParam, Anthropic::Models::Beta::BetaSystemMessageParam>]
        private def current_messages = params&.[](:messages).to_a

        # @return [Anthropic::Models::BetaMessage, nil]
        def next_message
          message = nil
          fold do |params|
            message = create_message(params)
            [true, message]
          end
          message
        end

        # @return [Array<Anthropic::Models::BetaMessage>]
        def run_until_finished
          messages = []
          # Not `each_streaming`: an error from this block is the runner's, not the application's.
          fold do |params|
            stream = stream_message(params)
            message = stream.accumulated_message
            messages << message
            [false, message]
          ensure
            stream&.close
          end
          messages.compact
        end

        # @yieldparam [Anthropic::Models::BetaMessage]
        def each_message(&blk)
          unless block_given?
            raise ArgumentError.new("A block must be given to ##{__method__}")
          end

          fold do |params|
            message = create_message(params)
            in_app { blk.call(message) }
            [false, message]
          end
        end

        # @yieldparam [Anthropic::Internal::Stream<Anthropic::Models::Beta::BetaRawMessageStartEvent, Anthropic::Models::Beta::BetaRawMessageDeltaEvent, Anthropic::Models::Beta::BetaRawMessageStopEvent, Anthropic::Models::Beta::BetaRawContentBlockStartEvent, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent, Anthropic::Models::Beta::BetaRawContentBlockStopEvent>]
        def each_streaming(&blk)
          unless block_given?
            raise ArgumentError.new("A block must be given to ##{__method__}")
          end

          fold do |params|
            stream = stream_message(params)
            in_app { blk.call(stream) }
            [false, stream.accumulated_message]
          ensure
            stream&.close
          end
        end

        # @api private
        #
        # @param params [Anthropic::Models::Beta::MessageCreateParams]
        #
        # @return [Anthropic::Models::BetaMessage]
        private def create_message(params)
          request = with_helper_header(params, StainlessHelperHeader::BETA_TOOL_RUNNER)
          return @client.beta.messages.create(request) if @thread.nil?

          @thread.send_message(**request.slice(:request_options))
        end

        # @api private
        #
        # @param params [Anthropic::Models::Beta::MessageCreateParams]
        #
        # @return [Anthropic::Streaming::MessageStream]
        private def stream_message(params)
          request = with_helper_header(params, StainlessHelperHeader::BETA_TOOL_RUNNER)
          return @client.beta.messages.stream(request) if @thread.nil?

          @thread.stream(**request.slice(:request_options))
        end

        # @api private
        #
        # The thread sends what `params` adds to the messages that the API holds. What was appended
        # to the thread itself since it was last given the messages joins them first.
        #
        # @param params [Anthropic::Models::Beta::MessageCreateParams]
        private def give_thread(params)
          appended = @thread.appended_after(@given_count)
          current_messages.concat(appended) unless appended.empty?
          @thread.replace_params(params.to_h.except(:stream, :thread))
          @given_count = current_messages.length
        end

        # @api private
        #
        # Runs the runner's own code with the tool runner span current.
        private def in_tool_runner(&blk)
          otel_context = @tool_runner_otel_context
          otel_context ? OpenTelemetry::Context.with_current(otel_context, &blk) : yield
        end

        # @api private
        #
        # @param raw [Object]
        #
        # @return [Array<Object>, String]
        private def tool_result_content(raw) = raw.is_a?(Array) ? raw : raw.to_s

        # @api private
        #
        # Runs the application's block in the context it started the loop from, where the tool runner
        # span is not current. An error it raises is the application stopping the runner, except an API
        # error: that is the stream the runner yielded failing as the application reads it.
        private def in_app(&blk)
          otel_context = @app_otel_context
          otel_context ? OpenTelemetry::Context.with_current(otel_context, &blk) : yield
        rescue Anthropic::Errors::APIError
          raise
        rescue StandardError
          @stopped_by_app = true
          raise
        end

        # @api private
        #
        # Runs one loop in its `anthropic.messages.tool_runner` span, which has no status when the
        # application stops the loop.
        #
        # @yieldparam [Array(Boolean, Anthropic::Models::Beta::MessageCreateParams)]
        private def fold(&blk)
          @compaction_phase = nil if @compaction_phase == :handling
          return nil if finished? && @pending_compaction.nil?

          # A loop the application starts from inside another one has its own span.
          outer = [@tool_runner_otel_context, @app_otel_context, @stopped_by_app]
          @stopped_by_app = false
          tool_runner_span = Anthropic::Helpers::Tracing.start_tool_runner_span(@client, params)
          if tool_runner_span
            @tool_runner_otel_context = OpenTelemetry::Trace.context_with_span(tool_runner_span)
            # The application can start each loop from another context, so it is read on every entry.
            @app_otel_context = OpenTelemetry::Context.current
          else
            @tool_runner_otel_context = @app_otel_context = nil
          end
          begin
            value = in_tool_runner { run_loop(&blk) }
            returned = true
            value
          rescue StandardError => e
            error = e unless @stopped_by_app
            raise
          ensure
            if tool_runner_span
              Anthropic::Helpers::Tracing.end_tool_runner_span(tool_runner_span, returned: returned, error: error)
            end
            @tool_runner_otel_context, @app_otel_context, @stopped_by_app = outer
          end
        end

        # @api private
        #
        # @yieldparam [Array(Boolean, Anthropic::Models::Beta::MessageCreateParams)]
        private def run_loop(&blk)
          brk = false
          # rubocop:disable Metrics/BlockLength
          # rubocop:disable Style/CaseEquality
          loop do
            break if finished?
            return if @max_iterations && @iteration_count >= @max_iterations

            reject_thread_param!(params)
            send_pending_tool_changes

            if @pending_compaction && !turn_paused?
              brk = compact(@pending_compaction, &blk)
              break if brk
              next
            end

            reject_compaction_param!(params)
            tools = params[:tools].to_a.grep(Anthropic::Helpers::Tools::BaseTool)
            # Checked first: messages that drop the last reply start a new thread, which takes any change.
            @thread&.check_create_only_fields!(params.to_h)
            give_thread(params) unless @thread.nil?
            messages = current_messages
            brk, response = blk.call(params)
            # A stream that ended before `message_start` has no message.
            return if @thread && response.nil?

            @last_response = response

            # Skip tool processing if messages were modified
            next unless current_messages.equal?(messages)

            next_step = determine_next_step_from_stop_reason(response.stop_reason)

            if next_step == :stop
              @finished = true
              break
            end

            tool_uses = next_step == :run_tools ? client_tool_uses(response) : []
            # No tool runs for a turn that the thread would refuse to send.
            @thread&.check_create_only_fields!(params.to_h)

            # A `tool_removal` block only hints the model, so a call to a withdrawn tool can still
            # arrive; a name missing from this set routes down the same "not found" path as an
            # undeclared tool.
            available = available_tool_names([*tools, *@tool_overrides.values.compact])

            mapped =
              tool_uses.map do |tool_use|
                resp = {type: :tool_result, tool_use_id: tool_use.id}
                # The result of a toolset member's call has to name the toolset as the call does.
                resp[:toolset_name] = tool_use[:toolset_name] if tool_use[:toolset_name].is_a?(String)
                if available.include?(tool_use.name) &&
                   (tool = @tool_overrides.fetch(tool_use.name) do
                     tools.find do
                       _1.class.model === tool_use.parsed && Anthropic::Helpers::Messages.tool_api_name(_1) == tool_use.name
                     end
                   end)
                  tool_use_span = Anthropic::Helpers::Tracing.start_tool_use_span(
                    @client,
                    tool,
                    tool_use,
                    params[:request_options]
                  )
                  begin
                    # `parsed` was read against `params[:tools]`, which an added tool is not in.
                    input = tool_use.parsed
                    input = Anthropic::Internal::Type::Converter.coerce(tool, tool_use.input) if @tool_overrides.key?(tool_use.name)
                    run = proc { tool.call(input) }
                    raw = tool_use_span ? OpenTelemetry::Trace.with_span(tool_use_span, &run) : run.call
                    is_error = false
                  rescue StandardError => e
                    is_error = true
                    raw = e.message
                  ensure
                    if tool_use_span
                      # `is_error` is unset when the run was interrupted, and then so is the span's status.
                      result = {content: tool_result_content(raw), is_error:} unless is_error.nil?
                      Anthropic::Helpers::Tracing.end_tool_use_span(@client, tool_use_span, tool_use.input, result)
                    end
                  end
                else
                  is_error = true
                  raw = "Error: parsed '#{tool_use.name}' not found"
                end
                content = tool_result_content(raw)
                {**resp, content:, is_error:}
              end

            if mapped.empty? && next_step == :run_tools
              @finished = true
              break
            end

            messages << assistant_turn(response)
            messages << {role: :user, content: mapped} unless mapped.empty?
            adopt_container(response)
            # The run can end here, and the thread goes on from the results.
            give_thread(params) unless @thread.nil?

            @iteration_count += 1

            break if brk
          end
          # rubocop:enable Style/CaseEquality
          # rubocop:enable Metrics/BlockLength

          compact_after_final_turn(&blk) if finished? && !brk
          nil
        end

        # @api private
        #
        # @param response [Anthropic::Models::BetaMessage]
        #
        # @return [Hash{Symbol=>Object}]
        private def assistant_turn(response)
          content = response.content.map do
            case _1
            # The class alone doesn't make a block a tool call, see `#client_tool_uses`.
            in Anthropic::Beta::BetaToolUseBlock if block_type(_1) == :tool_use
              # `parsed` is only set for calls to a declared tool; any other call (e.g. to an
              # unregistered tool) must replay the `input` the API sent, never a null. So must a
              # tool `add_tools` / `remove_tools` changed: `parsed` came from `params[:tools]`.
              input = _1.parsed.nil? || @tool_overrides.key?(_1.name) ? _1.input : _1.parsed
              raw = {**_1, input:}.except(:parsed)
              Anthropic::Internal::Type::Converter.dump(Anthropic::Beta::BetaToolUseBlock, raw)
            else
              _1
            end
          end

          {role: :assistant, content:}
        end

        # @api private
        #
        # A block of a type this SDK version doesn't know is coerced to the closest model, which can
        # be `BetaToolUseBlock`, so the class alone doesn't make a block a tool call.
        #
        # @param response [Anthropic::Models::BetaMessage]
        #
        # @return [Array<Anthropic::Beta::BetaToolUseBlock>]
        private def client_tool_uses(response)
          response.content.grep(Anthropic::Beta::BetaToolUseBlock).select { block_type(_1) == :tool_use }
        end

        # @api private
        #
        # @param block [Anthropic::Models::Beta::BetaContentBlock, Hash{Symbol=>Object}]
        #
        # @return [Symbol, nil]
        private def block_type(block) = read_field(block, :type)&.to_sym

        # @api private
        #
        # @param params [Anthropic::Models::Beta::MessageCreateParams]
        private def reject_compaction_param!(params)
          return if params[:compaction].nil?

          raise ArgumentError.new(
            "`compaction` cannot be set on a tool runner: every request in the loop would compact again. " \
            "Call `#compact_before_next_turn` when the conversation should be compacted instead."
          )
        end

        # @api private
        #
        # @param params [Anthropic::Models::Beta::MessageCreateParams]
        private def reject_thread_param!(params)
          return if params[:thread].nil?

          raise ArgumentError.new(
            "`thread` cannot be set in the params of a tool runner, got #{params[:thread].inspect}. " \
            "The runner sets `thread` for each request itself. To run without a message thread, " \
            "create the runner with `thread: false`."
          )
        end

        # @api private
        #
        # @param params [Anthropic::Models::Beta::MessageCreateParams]
        private def check_can_compact!(params)
          # The compaction request is sent without `context_management`, so the API can't reject this
          # combination there: it would run and bill the compaction, then reject the next request,
          # where the compaction response and the compaction edit meet.
          edits = read_field(params[:context_management], :edits)
          return unless Array(edits).any? { read_field(_1, :type).to_s.start_with?("compact_") }

          raise ArgumentError.new(
            "`#compact_before_next_turn` can't be used while `context_management` has a compaction edit, " \
            "because the API doesn't accept a compaction block together with one. Remove the edit first."
          )
        end

        # @api private
        #
        # The API can't compact a conversation that ends mid-turn, so a paused turn is resumed first.
        #
        # @return [Boolean]
        private def turn_paused?
          !@last_response.nil? && determine_next_step_from_stop_reason(@last_response.stop_reason) == :resume
        end

        # @api private
        #
        # @param compaction [Anthropic::Models::Beta::BetaCompactionConfig, Hash{Symbol=>Object}]
        #
        # @return [Boolean] whether the caller asked for a single message
        private def compact(compaction, &blk)
          check_can_compact!(params)
          request = {**without_compaction_incompatible_params(params), compaction:}
          @pending_compaction = nil
          @compaction_phase = :in_flight
          unless @thread.nil?
            @thread.start_new_thread
            give_thread(request)
          end

          brk, response = blk.call(request)

          if response.content.any? { block_type(_1) == :compaction && !read_field(_1, :content).to_s.empty? }
            keep_removals_from_history
            # The response has to be sent back as it came, first, replacing the messages it summarizes.
            @params = {**params.to_h, messages: [assistant_turn(response)]}
          else
            warn("[anthropic-ruby] Compaction produced no summary; keeping the conversation as it is.")
          end
          # `#next_message` hands the response over only now; its caller is looking at it until the
          # runner is next advanced, which is when `#fold` clears this.
          @compaction_phase = :handling if brk
          brk
        ensure
          @compaction_phase = nil if @compaction_phase == :in_flight
          # The thread goes on with the runner's params, not with those of the compaction request.
          give_thread(params) unless @thread.nil?
        end

        # @api private
        #
        # A compaction request returns only the compaction block, never a reply, so the API rejects
        # the params that only shape a reply. The runner's later requests keep them.
        #
        # @param params [Anthropic::Models::Beta::MessageCreateParams, Hash{Symbol=>Object}]
        #
        # @return [Hash{Symbol=>Object}]
        private def without_compaction_incompatible_params(params)
          kept = params.to_h.except(:context_management, :stop_sequences, :output_format)
          forced_tool = [:any, :tool].include?(read_field(kept[:tool_choice], :type)&.to_sym)
          kept = without_output_format(forced_tool ? kept.except(:tool_choice) : kept)
          return kept unless kept[:fallbacks].is_a?(Array)

          fallbacks = kept[:fallbacks].map do
            fallback = Anthropic::Internal::Type::Converter.dump(Anthropic::Beta::BetaFallbackParam, _1)
            without_output_format(fallback)
          end
          {**kept, fallbacks:}
        end

        # @api private
        #
        # @param params [Hash{Symbol=>Object}] a request's params, or one of its fallbacks'
        #
        # @return [Hash{Symbol=>Object}]
        private def without_output_format(params)
          # Read in its wire form: a typed `BetaOutputConfig` holds `format` under its Ruby name, `format_`.
          dumped = Anthropic::Internal::Type::Converter.dump(
            Anthropic::Beta::BetaOutputConfig,
            params[:output_config]
          )
          output_config = dumped.to_h.except(:format)
          output_config.empty? ? params.except(:output_config) : {**params, output_config:}
        end

        # @api private
        private def compact_after_final_turn(&blk)
          return if @pending_compaction.nil?

          # The loop never adds the final turn to the history, so it is added here for the compaction
          # to cover it, and forgotten so that a later compaction doesn't add it again.
          unless @last_response.nil?
            if client_tool_uses(@last_response).any?
              # A turn that was cut short can end with tool calls that are never run, and the API
              # can't compact a conversation whose last turn has an unanswered tool call.
              warn(
                "[anthropic-ruby] The pending compaction was skipped because the last turn " \
                "(stop_reason: #{@last_response.stop_reason.inspect}) ended with tool calls that " \
                "were not run. Call `#compact_before_next_turn` again if you continue the conversation."
              )
              @pending_compaction = nil
              return
            end

            current_messages << assistant_turn(@last_response)
            @last_response = nil
          end

          compact(@pending_compaction, &blk)
        end

        # @api private
        #
        # A paused turn is sent back as it came, so nothing may follow it.
        private def send_pending_tool_changes
          return if @pending_tool_changes.empty? || @last_response&.stop_reason == :pause_turn

          current_messages << {role: :system, content: @pending_tool_changes}
          @pending_tool_changes = []
        end

        # @api private
        #
        # A compaction response replaces the history, `tool_removal` blocks included, so what the
        # history took away is taken out of the overrides first.
        private def keep_removals_from_history
          runnable = [*params[:tools].to_a.grep(Anthropic::Helpers::Tools::BaseTool), *@tool_overrides.values.compact]
          names = runnable.map { Anthropic::Helpers::Messages.tool_api_name(_1) }
          (names - available_tool_names(runnable).to_a).each { @tool_overrides.store(_1, nil) }
        end

        # @api private
        #
        # A stop reason this SDK version does not know yet ends the run like the terminal ones
        # instead of raising, since the enum is forward-compatible.
        #
        # @param stop_reason [Symbol, String, nil]
        #
        # @return [Symbol] :run_tools, :resume or :stop
        private def determine_next_step_from_stop_reason(stop_reason)
          case stop_reason
          when RUN_TOOLS_STOP_REASONS then :run_tools
          when RESUME_STOP_REASONS then :resume
          else :stop # STOP_STOP_REASONS and unknown values
          end
        end

        # @api private
        #
        # Container-bound server tools reject a follow-up that drops the container the previous
        # turn ran in, so its id is forwarded unless the caller pinned one themselves.
        #
        # @param response [Anthropic::Models::BetaMessage]
        private def adopt_container(response)
          id = response.container&.id
          return if id.nil? || id.empty?

          case (pinned = params[:container])
          in nil
            params[:container] = id
          in Hash | Anthropic::Beta::BetaContainerParams if read_field(pinned, :id).nil?
            params[:container] = {**pinned, id:}
          else
            nil
          end
        end

        # @api private
        #
        # Replays `tool_removal` / `tool_addition` blocks from `role: :system` messages to
        # find which tool names are still offered to the model. MCP references are
        # server-executed and never dispatched here, so they are ignored. The overrides already
        # hold the changes waiting to be sent, so those count as the history's last message.
        #
        # @param tools [Array<Anthropic::Helpers::Tools::BaseTool>]
        #
        # @return [Set<String>]
        private def available_tool_names(tools)
          available = Set.new(tools.map { Anthropic::Helpers::Messages.tool_api_name(_1) })
          [*current_messages, {role: :system, content: @pending_tool_changes}].each do |message|
            next unless read_field(message, :role)&.to_sym == :system

            Array(read_field(message, :content)).each { apply_tool_change(_1, available) }
          end
          available
        end

        # @api private
        #
        # @param block [Anthropic::Beta::BetaContentBlockParam, Hash{Symbol=>Object}]
        #
        # @param available [Set<String>]
        private def apply_tool_change(block, available)
          case read_field(block, :type)&.to_sym
          in :tool_removal
            name = changed_tool_name(read_field(block, :tool))
            available.delete(name) unless name.nil?
          in :tool_addition
            name = changed_tool_name(read_field(block, :tool))
            available.add(name) unless name.nil?
          else
            nil # non tool_removal / tool_addition blocks leave the set untouched
          end
        end

        # @api private
        #
        # @param tool [Anthropic::Beta::BetaToolChangeToolReference, Anthropic::Beta::BetaToolChangeToolDefinitionParam, Hash{Symbol=>Object}, nil]
        #
        # @return [String, nil]
        private def changed_tool_name(tool)
          case read_field(tool, :type)&.to_sym
          in :tool_reference
            read_field(tool, :name).to_s
          in :tool_definition
            # Not every `tools[]` entry has a name (e.g. `mcp_toolset`); those never run here.
            read_field(read_field(tool, :definition), :name)&.to_s
          else
            nil # `mcp_*` references run server-side; unknown types ignored (forward compatibility)
          end
        end

        # @api private
        #
        # Reads a field off either a plain hash (symbol or string keys) or a typed model.
        #
        # A model coerced from a string-keyed hash keeps those keys, unseen by its typed readers, and
        # a typed reader raises when it cannot coerce its stored value (e.g. string-keyed blocks in
        # `BetaSystemMessageParam#content`). Both read the raw value, like the equivalent hash.
        #
        # @param obj [Object]
        #
        # @param key [Symbol]
        #
        # @return [Object, nil]
        private def read_field(obj, key)
          case obj
          in Hash
            obj.fetch(key) { obj[key.to_s] }
          in Anthropic::Internal::Type::BaseModel
            obj.to_h.fetch(key.to_s) do
              obj.public_send(key) if obj.respond_to?(key)
            rescue Anthropic::Errors::ConversionError
              obj[key]
            end
          else
            nil
          end
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        #
        # @param params [Anthropic::Models::Beta::MessageCreateParams]
        #
        # @param max_iterations [Integer, nil]
        #
        # @param thread [Anthropic::Helpers::Threads::BetaMessageThread, nil] sends the requests, each
        #   with the whole history when `nil`
        def initialize(client, params:, max_iterations: nil, thread: nil)
          @client = client
          @thread = thread
          @given_count = thread&.messages.to_a.length
          @params = params.to_h
          reject_compaction_param!(@params)
          @finished = false
          @max_iterations = max_iterations
          @iteration_count = 0
          @last_response = nil
          @pending_tool_changes = []
          @tool_overrides = {}
          @pending_compaction = nil
          @compaction_phase = nil
          @tool_runner_otel_context = nil
          @app_otel_context = nil
          @stopped_by_app = false
        end

        private def with_helper_header(params, helper)
          options = params[:request_options] || {}
          headers = options[:extra_headers] || {}
          merged = StainlessHelperHeader.merged_value(headers, helper)

          {
            **params,
            request_options: {**options, extra_headers: {**headers, StainlessHelperHeader::HEADER => merged}}
          }
        end
      end
    end
  end
end
