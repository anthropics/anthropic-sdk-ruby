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
              message = @client.beta.messages.create(_1)
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
            message = @client.beta.messages.create(_1)
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
            stream = @client.beta.messages.stream(_1)
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

          count =
            case @param
            in {max_iterations: Integer => m}
              m
            else
              nil
            end

          # rubocop:disable Metrics/BlockLength
          # rubocop:disable Style/CaseEquality
          loop do
            return if (count = count&.pred)&.negative?

            tools = params[:tools].to_a.grep(Anthropic::Helpers::Tools::BaseTool)
            messages = current_messages
            brk, response = blk.call(params)

            next unless current_messages.equal?(messages)

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

            break if brk
          end
          # rubocop:enable Style/CaseEquality
          # rubocop:enable Metrics/BlockLength
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        #
        # @param params [Anthropic::Models::Beta::MessageCreateParams]
        def initialize(client, params:)
          @client = client
          @params = params.to_h
          @finished = false
        end
      end
    end
  end
end
