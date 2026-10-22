# frozen_string_literal: true

module Anthropic
  module Helpers
    module Threads
      # A conversation that the API keeps between requests, so that each turn sends only the
      # messages that are new. Create one with `client.beta.messages.thread(...)`.
      #
      # A thread runs one turn at a time and is not safe for concurrent use.
      class BetaMessageThread
        THREADS_BETA = Anthropic::Models::AnthropicBeta::MESSAGE_THREADS_2026_08_12.to_s
        NOT_FOUND_ERROR_CODE = "thread_not_found"
        # A `continue` rejected with one of these is sent again as a `create`.
        REPLAY_ERROR_CODES = Set[NOT_FOUND_ERROR_CODE, "thread_already_continued", "thread_continue_in_flight"].freeze
        UNSUPPORTED_REQUEST_ERROR_CODE = "thread_unsupported_request"
        UNSUPPORTED_REQUEST_BEHAVIORS = Set[:error, :continue_unthreaded].freeze

        # How the next turn relates to what the API holds. It is always exactly one of these.
        #
        # The next turn starts a new thread with the whole history. `after_not_found` is whether it
        # does so because the API answered a `continue` with `thread_not_found`.
        Create = Data.define(:after_not_found) do
          def initialize(after_not_found: false) = super
        end
        # The next turn continues from `previous_message_id` and sends what follows the recorded
        # messages. `created_with` is the `system` and `tools` that the API keeps for the thread.
        # `after_not_found` is that of the `Create` the thread began with, until a `continue` succeeds.
        Continue = Data.define(:previous_message_id, :created_with, :after_not_found)
        # Every turn sends the whole history and no `thread`.
        Unthreaded = Data.define

        # One message of the history, as the API receives it and frozen.
        Entry = Data.define(:param, :reply_id, :partial) do
          # @param message [Anthropic::Models::Beta::BetaUserMessageParam, Anthropic::Models::Beta::BetaAssistantMessageParam, Anthropic::Models::Beta::BetaSystemMessageParam, Anthropic::Models::Beta::BetaMessage, Hash{Symbol=>Object}]
          def self.given(message) = build(message, reply_id: nil, partial: false)

          # @param reply [Anthropic::Models::Beta::BetaMessage] a reply that a turn of the thread received
          # @param partial [Boolean] whether its stream ended before `message_stop`
          def self.received(reply, partial: false) = build(reply, reply_id: reply.id, partial:)

          def self.build(message, **)
            message = {role: :assistant, content: message.content} if message.is_a?(Anthropic::Models::Beta::BetaMessage)
            param = Anthropic::Internal::Type::Converter.dump(Anthropic::Models::Beta::BetaMessageParam, message)
            new(param: Anthropic::Internal::Util.deep_frozen_copy(param), **)
          end
          private_class_method :new, :[], :build

          # A typed message or block has its `role` or `type` last, and a Hash has it where the caller put it.
          #
          # @return [Hash{String=>Object}] two messages are sent alike exactly when these are equal
          def wire = JSON.parse(param.to_json)
        end

        # One request of a turn: the params for `create`, its `system_` and `tools` as given and as
        # sent, and the classes that its reply parses into.
        Request = Data.define(:params, :create_only, :created_with, :tools, :models)

        private_constant :THREADS_BETA,
                         :NOT_FOUND_ERROR_CODE,
                         :REPLAY_ERROR_CODES,
                         :UNSUPPORTED_REQUEST_ERROR_CODE,
                         :UNSUPPORTED_REQUEST_BEHAVIORS,
                         :Create,
                         :Continue,
                         :Unthreaded,
                         :Entry,
                         :Request

        # The whole history: every message that was sent, every reply, and the messages staged
        # for the next turn.
        #
        # @return [Array<Hash{Symbol=>Object}>] frozen
        def messages = @history.map(&:param).freeze

        # The reply the next turn continues from, or `nil` when the next turn starts a new thread.
        #
        # @return [String, nil]
        def previous_message_id = @anchor.is_a?(Continue) ? @anchor.previous_message_id : nil

        # What `client.beta.messages.thread` takes to create a thread that behaves the same, with
        # `messages` set to the whole history.
        #
        # @return [Hash{Symbol=>Object}] a frozen copy
        def params
          options = @request_options.empty? ? {} : {request_options: @request_options}
          given = {**@fields, **options, unsupported_request_behavior: @unsupported_request_behavior}
          Anthropic::Internal::Util.deep_frozen_copy(given).merge(messages:).freeze
        end

        # Stages messages for the next turn without sending them.
        #
        # @param messages [Array<Anthropic::Models::Beta::BetaUserMessageParam, Anthropic::Models::Beta::BetaAssistantMessageParam, Anthropic::Models::Beta::BetaSystemMessageParam, Anthropic::Models::Beta::BetaMessage, Hash{Symbol=>Object}>]
        #
        # @return [void]
        def append(*messages)
          messages.each { @history << Entry.given(_1) unless repeats_last_reply?(_1) }
          nil
        end

        # Changes the thread's request fields for every later turn, where `nil` removes a field. It
        # sends no request. `system_` and `tools` cannot change once a turn has created the thread.
        #
        # @param params [Hash{Symbol=>Object}]
        #
        # @raise [ArgumentError] if `messages`, `thread` or `stream` is given
        #
        # @return [void]
        def update(**params)
          fields, options = split_params(params)
          reject_key!(fields, :messages, "Use `#append` to add messages to a message thread.")

          @fields = overlay(@fields, fields)
          @request_options = overlay(@request_options, options)
          nil
        end

        # Returns a new, independent thread with this thread's history and request fields. It sends
        # no request.
        #
        # @return [Anthropic::Helpers::Threads::BetaMessageThread]
        def fork = dup.tap(&:start_new_thread)

        # Creates a tool runner that runs over this thread. It sends no request.
        #
        # @param max_iterations [Integer, nil]
        #
        # @return [Anthropic::Helpers::Tools::Runner]
        def tool_runner(max_iterations: nil)
          # As in `#start_turn`.
          history = @history.last&.partial ? @history[...-1] : @history
          Anthropic::Helpers::Tools::Runner.new(
            @client,
            # The runner's params are those of its requests, and the thread applies its own behavior.
            params: {**params.except(:unsupported_request_behavior), messages: history.map(&:param)},
            max_iterations:,
            thread: self
          )
        end

        # Sends the messages staged with {#append}, followed by `messages`, as one turn and returns
        # the reply. `params` takes the keywords of {#update} and applies to this turn only.
        #
        # @param messages [Array<Anthropic::Models::Beta::BetaUserMessageParam, Anthropic::Models::Beta::BetaAssistantMessageParam, Anthropic::Models::Beta::BetaSystemMessageParam, Anthropic::Models::Beta::BetaMessage, Hash{Symbol=>Object}>]
        #
        # @param params [Hash{Symbol=>Object}]
        #
        # @raise [Anthropic::Errors::Error] if another turn is in progress on this thread, or if
        #   the turn continues the thread and changes `system_` or `tools`
        #
        # @return [Anthropic::Models::Beta::BetaMessage]
        def send_message(*messages, **params)
          overrides = start_turn(messages, params)
          begin
            request, reply = send_request(*overrides) { @client.beta.messages.create(_1) }
            parse_reply!(reply, request)
            record_reply(request, reply)
            reply
          ensure
            end_turn
          end
        end

        # Sends the next turn like {#send_message} and returns the stream of the reply. The turn is
        # in progress until the stream ends or is closed.
        #
        # @param messages [Array<Anthropic::Models::Beta::BetaUserMessageParam, Anthropic::Models::Beta::BetaAssistantMessageParam, Anthropic::Models::Beta::BetaSystemMessageParam, Anthropic::Models::Beta::BetaMessage, Hash{Symbol=>Object}>]
        #
        # @param params [Hash{Symbol=>Object}]
        #
        # @raise [Anthropic::Errors::Error] if another turn is in progress on this thread, or if
        #   the turn continues the thread and changes `system_` or `tools`
        #
        # @return [Anthropic::Streaming::MessageStream]
        def stream(*messages, **params)
          overrides = start_turn(messages, params)
          begin
            request, raw_stream = send_request(*overrides) { @client.beta.messages.stream_raw(_1) }
            stream = Stream.new(raw_stream:, thread: self, request:)
          ensure
            end_turn if stream.nil?
          end
        end

        # @api private
        #
        # Replaces the request fields, the request options and the history. `messages` that begin
        # with the recorded messages keep the thread, and the rest is staged. Any other list is
        # staged as a whole and starts a new thread.
        #
        # @param params [Hash{Symbol=>Object}]
        #
        # @return [void]
        def replace_params(params)
          check_idle!
          fields, options = split_params(params)
          history = fields.delete(:messages).to_a.map { Entry.given(_1) }
          if history.first(recorded.length).map(&:wire) == recorded.map(&:wire)
            history[0, recorded.length] = recorded
          else
            start_new_thread
          end

          @fields = fields
          @request_options = options
          @history = history
          nil
        end

        # @api private
        #
        # The messages after the first `count` and after the reply to those, if one was recorded.
        # As in {#append}, the last reply appended again does not count.
        #
        # @param count [Integer]
        #
        # @return [Array<Hash{Symbol=>Object}>]
        def appended_after(count)
          rest = @history.drop(count)
          rest.shift unless rest.first&.reply_id.nil?
          last_reply = @history.first(count).reverse_each.find { _1.param[:role].to_s == "assistant" }
          rest.reject { _1.wire == last_reply&.wire }.map(&:param)
        end

        # @api private
        #
        # Makes the next turn start a new thread with the whole history.
        #
        # @return [void]
        def start_new_thread
          @anchor = Create.new unless @anchor.is_a?(Unthreaded)
          nil
        end

        # @api private
        #
        # A `continue` leaves out `system` and `tools`, so the API cannot reject a change.
        #
        # @param params [Hash{Symbol=>Object}]
        #
        # @raise [Anthropic::Errors::Error] if a next turn with `params` continues the thread and
        #   changes `system_` or `tools`
        #
        # @return [void]
        def check_create_only_fields!(params)
          refuse_change!(create_only_fields(wire_request(params.slice(:system, :system_, :tools)).first))
        end

        # @api private
        #
        # Ends the turn in progress with `reply`, from which the next turn continues. The API may
        # hold a refused turn, which a `continue` cannot remove, so such a turn ends with no reply
        # and the next turn starts a new thread.
        #
        # @param request [Request]
        #
        # @param reply [Anthropic::Models::Beta::BetaMessage]
        #
        # @return [void]
        def record_reply(request, reply)
          if reply.stop_reason == Anthropic::Models::Beta::BetaStopReason::REFUSAL
            start_new_thread
            return end_turn
          end

          @history.insert(@turn, Entry.received(reply))
          unless @anchor.is_a?(Unthreaded)
            @anchor = Continue.new(
              previous_message_id: reply.id,
              created_with: request.created_with,
              after_not_found: @anchor.is_a?(Create) && @anchor.after_not_found
            )
            # What the turn that created the thread sent is the thread's from then on.
            @fields = {**@fields.except(:system_, :tools), **request.create_only}
            # A thread keeps one model, so the API does not hold a reply that a fallback model wrote.
            start_new_thread if reply.usage.iterations.to_a.any? { _1 in {type: :fallback_message} }
          end
          adopt_container(reply)
          @turn = nil
        end

        # @api private
        #
        # Ends a turn whose stream ended after `message_start` and before `message_stop`. The API
        # holds either the whole reply or none of it, so the next turn starts a new thread.
        #
        # @param reply [Anthropic::Models::Beta::BetaMessage, nil] the part of the reply worth keeping
        #
        # @return [void]
        def record_partial_reply(reply)
          @history.insert(@turn, Entry.received(reply, partial: true)) unless reply.nil?
          start_new_thread
          @turn = nil
        end

        # @api private
        #
        # Ends the turn in progress, if any, with no reply. The thread takes back the messages that
        # were passed to the call.
        #
        # @return [void]
        def end_turn
          @history.slice!(@turn - @passed, @passed) unless @turn.nil?
          @turn = nil
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        #
        # @param params [Hash{Symbol=>Object}] the fields of `create`, with `messages` as the seed
        #
        # @param unsupported_request_behavior [Symbol] `:error` or `:continue_unthreaded`
        def initialize(client, params:, unsupported_request_behavior: :error)
          unless UNSUPPORTED_REQUEST_BEHAVIORS.include?(unsupported_request_behavior)
            raise ArgumentError.new(
              "`unsupported_request_behavior` must be `:error` or `:continue_unthreaded`, " \
              "got #{unsupported_request_behavior.inspect}"
            )
          end

          @client = client
          @unsupported_request_behavior = unsupported_request_behavior
          @fields, @request_options = split_params(params)
          @history = @fields.delete(:messages).to_a.map { Entry.given(_1) }
          @anchor = Create.new
          # The index in the history at which the reply of the turn in progress goes, `nil` when none is.
          @turn = nil
          # How many of the messages before that index were passed to the call that started the turn.
          @passed = 0
        end

        private

        def initialize_copy(source)
          super
          @history = @history.dup
          @turn = nil
        end

        # @return [Array(Hash{Symbol=>Object}, Hash{Symbol=>Object})] the fields and the request options
        def split_params(params)
          fields = params.to_h.transform_keys(&:to_sym)
          reject_key!(fields, :thread, "The message thread sets `thread` for each request itself.")
          reject_key!(fields, :stream, "Use `#stream` to stream a turn of a message thread.")
          # `create` takes the system prompt as `system_`; one name keeps an override from sending both.
          fields[:system_] = fields.delete(:system) if fields.key?(:system)

          options = Anthropic::Internal::Util.coerce_hash!(fields.delete(:request_options)).to_h
          [fields, options.transform_keys(&:to_sym)]
        end

        def reject_key!(fields, key, hint)
          raise ArgumentError.new("`#{key}` cannot be given here. #{hint}") if fields.key?(key)
        end

        def overlay(base, overrides)
          overrides.each_with_object(base.dup) do |(key, value), merged|
            value.nil? ? merged.delete(key) : merged.store(key, value)
          end
        end

        def repeats_last_reply?(message)
          last = @history.last
          return false if last&.reply_id.nil?
          return message.id == last.reply_id if message.is_a?(Anthropic::Models::Beta::BetaMessage)

          Entry.given(message).wire == last.wire
        end

        def check_idle!
          return if @turn.nil?

          raise Anthropic::Errors::Error.new(
            "Another turn is in progress on this message thread. Wait for it to end, or close its stream."
          )
        end

        # @return [Array(Hash{Symbol=>Object}, Hash{Symbol=>Object})] the turn's fields and request options
        def start_turn(messages, params)
          check_idle!
          fields, options = split_params(params)
          reject_key!(fields, :messages, "Pass the messages of a turn as positional arguments.")

          staged = @history.length
          append(*messages)
          @passed = @history.length - staged
          # With nothing after it, a partial reply gives way to the whole reply of the same turn.
          @history.pop if @history.last&.partial
          @turn = @history.length
          [fields, options]
        end

        # Sends the request of the turn in progress, and again for as long as the thread recovers
        # from an error that rejected it.
        #
        # @return [Array(Request, Object)] the request that went through and what the block returned
        def send_request(fields, options)
          loop do
            request = plan_request(fields, options)
            begin
              return [request, yield(request.params)]
            rescue Anthropic::Errors::APIStatusError => e
              raise unless recovers_from?(e)
            end
          end
        end

        # @return [Request]
        def plan_request(fields, options)
          fields = overlay(@fields, fields)
          wire, tools, models = wire_request(fields)
          refuse_change!(created_with = create_only_fields(wire))
          create_only = fields.slice(:system_, :tools)
          # Sent as schemas, because `create` names another beta for a class. The thread reads the reply.
          fields = {**fields.except(:output_format), **wire.slice(:tools, :output_config, :output_format)}
          betas = [*fields[:betas], THREADS_BETA].uniq(&:to_s)

          params =
            case @anchor
            in Create
              {**fields, betas:, thread: {type: :create}, messages: whole_history}
            in Continue[previous_message_id:]
              thread = {type: :continue, previous_message_id:}
              {**fields.except(:system_, :tools), betas:, thread:, messages: messages.drop(recorded.length)}
            in Unthreaded
              {**fields, messages: whole_history}
            end
          options = overlay(@request_options, options)
          headers = options[:extra_headers].to_h
          helpers = StainlessHelperHeader.merged_value(headers, StainlessHelperHeader::MESSAGE_THREAD)
          params[:request_options] = {**options, extra_headers: {**headers, StainlessHelperHeader::HEADER => helpers}}

          Request.new(params:, create_only:, created_with:, tools:, models:)
        end

        # The messages that were sent and answered: those up to the last reply that a turn received.
        #
        # @return [Array<Entry>]
        def recorded = @history.take((@history.rindex(&:reply_id) || -1) + 1)

        # The history as a request that sends all of it carries it. The cache breakpoints of the
        # recorded messages add up over the turns, so those messages go without them. The other
        # messages go as given.
        #
        # @return [Array<Hash{Symbol=>Object}>]
        def whole_history
          sent_before = recorded.map { without_cache_control(_1.param) }
          sent_before + messages.drop(sent_before.length)
        end

        # Enters only the keys that lead to a marker. Any other value may hold any key, so it is kept whole.
        def without_cache_control(value)
          return value unless value.is_a?(Hash)

          value.except(:cache_control, "cache_control").to_h do |key, nested|
            next [key, nested] unless %w[content source tool definition tool_references].include?(key.to_s)

            [key, nested.is_a?(Array) ? nested.map { without_cache_control(_1) } : without_cache_control(nested)]
          end
        end

        # @return [Array(Hash{Symbol=>Object}, Hash{String=>Class}, Hash{String=>Class})] the request
        #   as the API would receive it, and the classes that its tool inputs and output parse into
        def wire_request(fields)
          wire, = Anthropic::Models::Beta::MessageCreateParams.dump_request(fields)
          tools, models = Anthropic::Helpers::Messages.distill_input_schema_models!(wire, strict: nil, is_beta: true)
          [wire, tools, models]
        end

        def create_only_fields(wire) = {system_: wire[:system], tools: wire[:tools]}.transform_values(&:to_json)

        def refuse_change!(created_with)
          return if !@anchor.is_a?(Continue) || created_with == @anchor.created_with

          changed = created_with.reject { |field, value| value == @anchor.created_with[field] }.keys
          message =
            "Cannot change #{changed.map { "`#{_1}`" }.join(' and ')} on a thread: the server keeps the " \
            "`system_` and `tools` the thread was created with. To change them, start a new thread from " \
            "`thread.params`."
          if changed.include?(:tools)
            message +=
              " To add or remove tools on this thread, send `tool_addition` or `tool_removal` blocks in a " \
              "`system` message."
          end
          raise Anthropic::Errors::Error.new(message)
        end

        # Sets `parsed` on the content blocks of `reply`, as `create` does for a request that holds
        # the classes to parse them into.
        def parse_reply!(reply, request)
          reply.content.to_a.each_with_index do |block, index|
            parsed =
              begin
                case block
                in Anthropic::Models::Beta::BetaToolUseBlock[type: :tool_use] if (tool = request.tools[block.name])
                  Anthropic::Internal::Type::Converter.coerce(tool, block.input)
                in Anthropic::Models::Beta::BetaTextBlock if (model = request.models.first&.last)
                  Anthropic::Internal::Type::Converter.coerce(model, JSON.parse(block.text, symbolize_names: true))
                else
                  next
                end
              rescue StandardError => e
                {error: e.message}
              end
            reply.content[index] = Anthropic::Internal::Type::Converter.coerce(block.class, {**block.to_h, parsed:})
          end
        end

        # Container-bound server tools reject a request that leaves out the container the turn
        # before it ran in, so its id is sent on later turns unless the caller named one.
        def adopt_container(reply)
          id = reply.container&.id
          return if id.nil? || id.empty?

          case (pinned = @fields[:container])
          in nil
            @fields = {**@fields, container: id}
          in Hash | Anthropic::Internal::Type::BaseModel if pinned.to_h.transform_keys(&:to_sym)[:id].nil?
            @fields = {**@fields, container: {**pinned.to_h, id:}}
          else
            nil
          end
        end

        # Whether the turn should be sent again because the API rejected its `thread` in a way the
        # thread has now adjusted for.
        def recovers_from?(error)
          body = error.body
          code = body.is_a?(Hash) ? body.dig(:error, :details, :error_code) : nil
          unsupported = code == UNSUPPORTED_REQUEST_ERROR_CODE
          not_found = code == NOT_FOUND_ERROR_CODE
          # The API may be unable to store a conversation whose new thread it does not hold either.
          unsupported ||= not_found && @anchor.is_a?(Continue) && @anchor.after_not_found

          case @anchor
          in Create | Continue if unsupported && @unsupported_request_behavior == :continue_unthreaded
            @anchor = Unthreaded.new
          in Continue if REPLAY_ERROR_CODES.include?(code)
            @anchor = Create.new(after_not_found: not_found)
          else
            return false
          end
          true
        end

        # @api private
        #
        # The stream of one turn. It tells the thread how the turn ended.
        class Stream < Anthropic::Helpers::Streaming::MessageStream
          # Ends the stream. When the reply has started and `message_stop` has not arrived, the
          # thread records the part of the reply that arrived.
          #
          # @return [void]
          def close
            finish
            @raw_stream.close
            super
          end

          # @param raw_stream [Anthropic::Internal::Type::BaseStream]
          #
          # @param thread [Anthropic::Helpers::Threads::BetaMessageThread]
          #
          # @param request [Request]
          def initialize(raw_stream:, thread:, request:)
            @thread = thread
            @request = request
            @ended = false
            @snapshot = nil
            @finished_blocks = 0
            super(raw_stream:, tools: request.tools, models: request.models)
          end

          private

          def iterator
            events = super
            @iterator = Anthropic::Internal::Util.chain_fused(events) do |y|
              events.each(&y)
            ensure
              finish
            end
          end

          def build_events(event:, message_snapshot:)
            @snapshot = message_snapshot
            case event.type
            in :content_block_stop
              @finished_blocks += 1
            in :message_stop unless @ended
              @ended = true
              @thread.record_reply(@request, message_snapshot)
            else
              nil
            end
            super
          end

          # Tells the thread, once, that the stream ended before `message_stop`.
          def finish
            return if @ended

            @ended = true
            case @snapshot
            in nil
              @thread.end_turn
            in {stop_reason: Anthropic::Models::Beta::BetaStopReason::REFUSAL}
              @thread.record_reply(@request, @snapshot)
            else
              @thread.record_partial_reply(partial_reply)
            end
          end

          # The part of the reply worth keeping: the content blocks that finished, and the block
          # after them if it is a text block with text. Any other unfinished block is dropped,
          # because its input or signature is incomplete.
          #
          # @return [Anthropic::Models::Beta::BetaMessage, nil]
          def partial_reply
            content = @snapshot.content.to_a.first(@finished_blocks)
            open = @snapshot.content.to_a[@finished_blocks]
            content << open if open&.type == :text && !open.text.empty?
            return nil if content.empty?

            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Models::Beta::BetaMessage,
              {**@snapshot.to_h, content:}
            )
          end
        end
        private_constant :Stream
      end
    end
  end
end
