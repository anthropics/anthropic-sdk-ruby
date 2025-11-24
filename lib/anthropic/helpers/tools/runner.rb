# frozen_string_literal: true

module Anthropic
  module Helpers
    module Tools
      # @api private
      #
      class Runner
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
              message = @client.beta.messages.create(with_helper_header(_1, "runner"))
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
            message = @client.beta.messages.create(with_helper_header(_1, "runner"))
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
            stream = @client.beta.messages.stream(with_helper_header(_1, "runner"))
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

            mapped =
              response
              .content
              .lazy
              .grep(Anthropic::Beta::BetaToolUseBlock)
              .map do |tool_use|
                resp = {type: :tool_result, tool_use_id: tool_use.id}
                if (tool = tools.find { _1.class.model === tool_use.parsed })
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
              .to_a

            if mapped.empty?
              @finished = true
              break
            end

            content = response.content.map do
              case _1
              in Anthropic::Beta::BetaToolUseBlock
                raw = {**_1, input: _1.parsed}.except(:parsed)
                Anthropic::Internal::Type::Converter.dump(Anthropic::Beta::BetaToolUseBlock, raw)
              else
                _1
              end
            end

            messages << {role: :assistant, content:}
            messages << {role: :user, content: mapped}

            @iteration_count += 1

            break if brk
          end
          # rubocop:enable Style/CaseEquality
          # rubocop:enable Metrics/BlockLength
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

          {**params, request_options: {**options, extra_headers: {**headers, "x-stainless-helper" => helper}}}
        end
      end
    end
  end
end
