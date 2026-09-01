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
        attr_accessor :params

        # @return [Boolean]
        def finished? = @finished

        # @param params [Array<Anthropic::Beta::BetaMessageParam>]
        def feed_messages(*messages)
          self.params = {**params.to_h, messages: params[:messages].to_a + messages}
        end

        # @return [Array<Anthropic::Beta::BetaMessageParam>]
        private def current_messages = params&.[](:messages).to_a

        # @return [Anthropic::Models::BetaMessage, nil]
        def next_message
          message = nil
          unless finished?
            fold do
              message = @client.beta.messages.create(with_helper_header(_1, StainlessHelperHeader::BETA_TOOL_RUNNER))
              [true, message]
            end
          end
          message
        end

        # @return [Array<Anthropic::Models::BetaMessage>]
        def run_until_finished
          messages = []
          each_streaming { messages << _1.accumulated_message }
          messages
        end

        # @yieldparam [Anthropic::Models::BetaMessage]
        def each_message(&blk)
          unless block_given?
            raise ArgumentError.new("A block must be given to ##{__method__}")
          end

          fold do
            message = @client.beta.messages.create(with_helper_header(_1, StainlessHelperHeader::BETA_TOOL_RUNNER))
            blk.call(message)
            [false, message]
          end
        end

        # @yieldparam [Anthropic::Internal::Stream<Anthropic::Models::Beta::BetaRawMessageStartEvent, Anthropic::Models::Beta::BetaRawMessageDeltaEvent, Anthropic::Models::Beta::BetaRawMessageStopEvent, Anthropic::Models::Beta::BetaRawContentBlockStartEvent, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent, Anthropic::Models::Beta::BetaRawContentBlockStopEvent>]
        def each_streaming(&blk)
          unless block_given?
            raise ArgumentError.new("A block must be given to ##{__method__}")
          end

          fold do
            stream = @client.beta.messages.stream(with_helper_header(_1, StainlessHelperHeader::BETA_TOOL_RUNNER))
            blk.call(stream)
            [false, stream.accumulated_message]
          ensure
            stream&.close
          end
        end

        # @api private
        #
        # @yieldparam [Array(Boolean, Anthropic::Models::Beta::MessageCreateParams)]
        private def fold(&blk)
          return nil if finished?

          # rubocop:disable Metrics/BlockLength
          # rubocop:disable Style/CaseEquality
          loop do
            return if @max_iterations && @iteration_count >= @max_iterations

            tools = params[:tools].to_a.grep(Anthropic::Helpers::Tools::BaseTool)
            messages = current_messages
            brk, response = blk.call(params)

            # Store the response for compaction check
            @last_response = response

            # Check and perform compaction if needed
            compacted = check_and_compact?

            # Skip tool processing if we just compacted or if messages were modified
            next unless current_messages.equal?(messages)
            break if compacted

            next_step = determine_next_step_from_stop_reason(response.stop_reason)

            if next_step == :stop
              @finished = true
              break
            end

            tool_uses =
              next_step == :run_tools ? response.content.grep(Anthropic::Beta::BetaToolUseBlock) : []

            # A `tool_removal` block only hints the model, so a call to a withdrawn tool can still
            # arrive; a name missing from this set routes down the same "not found" path as an
            # undeclared tool.
            available = available_tool_names(tools, messages)

            mapped =
              tool_uses.map do |tool_use|
                resp = {type: :tool_result, tool_use_id: tool_use.id}
                if available.include?(tool_use.name) &&
                   (tool = tools.find { _1.class.model === tool_use.parsed })
                  begin
                    raw = tool.call(tool_use.parsed)
                    is_error = false
                  rescue StandardError => e
                    is_error = true
                    raw = e.message
                  end
                else
                  is_error = true
                  raw = "Error: parsed '#{tool_use.name}' not found"
                end
                content = raw.is_a?(Array) ? raw : raw.to_s
                {**resp, content:, is_error:}
              end

            if mapped.empty? && next_step == :run_tools
              @finished = true
              break
            end

            content = response.content.map do
              case _1
              in Anthropic::Beta::BetaToolUseBlock
                # `parsed` is only set for calls to a declared tool; any other call (e.g. to an
                # unregistered tool) must replay the `input` the API sent, never a null.
                input = _1.parsed.nil? ? _1.input : _1.parsed
                raw = {**_1, input:}.except(:parsed)
                Anthropic::Internal::Type::Converter.dump(Anthropic::Beta::BetaToolUseBlock, raw)
              else
                _1
              end
            end

            messages << {role: :assistant, content:}
            messages << {role: :user, content: mapped} unless mapped.empty?
            adopt_container(response)

            @iteration_count += 1

            break if brk
          end
          # rubocop:enable Style/CaseEquality
          # rubocop:enable Metrics/BlockLength
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
        # server-executed and never dispatched here, so they are ignored.
        #
        # @param tools [Array<Anthropic::Helpers::Tools::BaseTool>]
        #
        # @param messages [Array<Anthropic::Beta::BetaMessageParam, Hash{Symbol=>Object}>]
        #
        # @return [Set<String>]
        private def available_tool_names(tools, messages)
          available = Set.new(tools.map { Anthropic::Helpers::Messages.tool_api_name(_1) })
          messages.each do |message|
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
            name = referenced_tool_name(read_field(block, :tool))
            available.delete(name) unless name.nil?
          in :tool_addition
            name = referenced_tool_name(read_field(block, :tool))
            available.add(name) unless name.nil?
          else
            nil # non tool_removal / tool_addition blocks leave the set untouched
          end
        end

        # @api private
        #
        # @param ref [Anthropic::Beta::BetaToolChangeToolReference, Hash{Symbol=>Object}, nil]
        #
        # @return [String, nil]
        private def referenced_tool_name(ref)
          case read_field(ref, :type)&.to_sym
          in :tool_reference
            read_field(ref, :name).to_s
          else
            nil # `mcp_*` references run server-side; unknown types ignored (forward compatibility)
          end
        end

        # @api private
        #
        # Reads a field off either a plain hash (symbol or string keys) or a typed model.
        #
        # A typed reader that cannot coerce its stored value (e.g. `BetaMessageParam#content`
        # on a directive-only message with `content: []`) falls back to the raw value, so the
        # typed form is walked exactly like the equivalent hash.
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
            begin
              obj.public_send(key) if obj.respond_to?(key)
            rescue Anthropic::Errors::ConversionError
              obj[key]
            end
          else
            nil
          end
        end

        # Check token usage and compact messages if threshold exceeded
        #
        # @return [Boolean] true if compaction occurred, false otherwise
        # @api private
        private def check_and_compact?
          return false unless @compaction_control&.[](:enabled)
          return false unless @last_response

          # Calculate total tokens used
          usage = @last_response.usage
          total_input_tokens = (
            usage.input_tokens.to_i +
            usage.cache_creation_input_tokens.to_i +
            usage.cache_read_input_tokens.to_i
          )
          tokens_used = total_input_tokens + usage.output_tokens.to_i

          # Check if we've exceeded the threshold
          threshold = @compaction_control[:context_token_threshold] || DEFAULT_THRESHOLD
          return false if tokens_used < threshold

          # Warn once about compaction (only if no callback provided)
          if @compaction_control[:on_compact].nil? && !@compaction_warned
            warn(
              "[anthropic-ruby] Context compaction triggered (#{tokens_used} tokens). " \
              "Use compaction_control: { on_compact: ->(before, after) { ... } } for details."
            )
            @compaction_warned = true
          end

          # Prepare compaction request
          model = @compaction_control[:model] || params[:model]
          summary_prompt = @compaction_control[:summary_prompt] || DEFAULT_SUMMARY_PROMPT

          # Prepare messages for compaction - handle tool_use blocks to avoid 400 errors
          messages_for_compaction = current_messages.dup

          # If last message is from assistant with tool_use blocks, we need to filter them out
          # because tool_use blocks require corresponding tool_result blocks
          if messages_for_compaction.last&.[](:role) == :assistant
            last_msg = messages_for_compaction.last
            content = last_msg[:content]

            if content.is_a?(Array)
              # Filter out tool_use blocks, keep text/thinking blocks
              non_tool_blocks = content.reject do |block|
                (block.is_a?(Hash) && block[:type] == :tool_use) ||
                  block.is_a?(Anthropic::Beta::BetaToolUseBlock)
              end

              if non_tool_blocks.empty?
                # If no content remains after filtering, remove the entire message
                messages_for_compaction.pop
              else
                # Keep the message but with filtered content
                last_msg[:content] = non_tool_blocks
              end
            end
          end

          messages = [
            *messages_for_compaction,
            {role: :user, content: summary_prompt}
          ]

          # Get summary from Claude
          response = @client.beta.messages.create(
            with_helper_header(
              {model: model, messages: messages, max_tokens: params[:max_tokens]},
              "compaction"
            )
          )

          # Validate that compaction response is text
          first_content = response.content.first
          unless first_content.is_a?(Anthropic::Beta::BetaTextBlock)
            raise "Compaction response content is not of type 'text', got: #{first_content.class}"
          end

          tokens_after = response.usage.output_tokens.to_i

          # Invoke callback if provided
          @compaction_control[:on_compact]&.call(tokens_used, tokens_after)

          # Replace message history with just the summary
          self.params = {
            **params,
            messages: [
              {role: :user, content: response.content}
            ]
          }

          true
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        #
        # @param params [Anthropic::Models::Beta::MessageCreateParams]
        #
        # @param max_iterations [Integer, nil]
        #
        # @param compaction_control [Hash, nil]
        def initialize(client, params:, max_iterations: nil, compaction_control: nil)
          @client = client
          @params = params.to_h
          @finished = false
          @max_iterations = max_iterations
          @iteration_count = 0
          @compaction_control = compaction_control
          @compaction_warned = false
          @last_response = nil
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
