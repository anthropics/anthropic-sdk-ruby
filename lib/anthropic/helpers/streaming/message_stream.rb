# frozen_string_literal: true

module Anthropic
  module Helpers
    module Streaming
      # @api private
      #
      # MessageStream provides a Ruby Enumerable interface over Server-Sent Events from
      # the Anthropic API, yielding a mix of raw streaming events and higher-level typed
      # events while maintaining accumulated message state throughout the stream lifecycle.
      #
      #
      # @generic Elem
      class MessageStream
        include Anthropic::Internal::Type::BaseStream

        # @api private
        #
        # Consumes raw stream events and yields a mix of raw and higher-level typed events while
        # maintaining accumulated message state. This is what's called when you run `each` on the
        # stream.
        #
        # @return [Enumerable<generic<Elem>>]
        private def iterator
          @iterator ||= Anthropic::Internal::Util.chain_fused(@stream) do |y|
            @raw_stream.each do |raw_event|
              @accumated_message_snapshot = accumulate_event(
                event: raw_event,
                current_snapshot: @accumated_message_snapshot
              )
              events_to_yield = build_events(event: raw_event, message_snapshot: @accumated_message_snapshot)
              events_to_yield.each(&y)
            end
          end
        end

        # @api public
        #
        # Blocks until the stream has been consumed
        #
        # @return [void]
        def until_done = each {} # rubocop:disable Lint/EmptyBlock

        # @api public
        #
        # Returns an enumerable of text deltas from the streaming response.
        #
        # @return [Enumerable<String>]
        def text
          Anthropic::Internal::Util.chain_fused(@iterator) do |y|
            @iterator.each do |event|
              if event.type == :content_block_delta && event.delta.type == :text_delta
                y << event.delta.text
              end
            end
          end
        end

        # @api public
        #
        # Returns the complete accumulated Message object after stream completion.
        #
        # @return [Anthropic::Models::Message]
        def accumulated_message
          until_done
          parse_tool_uses!(@accumated_message_snapshot) if @tool_models.any?
          @accumated_message_snapshot
        end

        # @api public
        #
        # Returns all text content blocks concatenated into a single string.
        # NOTE: Currently the API will only respond with a single content block.
        #
        # Will raise an error if no `text` content blocks were returned.
        # @return [String]
        def accumulated_text
          message = accumulated_message
          text_blocks = []
          message.content.each do |block|
            if block.type == :text
              text_blocks << block.text
            end
          end

          if text_blocks.empty?
            raise RuntimeError.new("Expected to have received at least 1 text block")
          end

          text_blocks.join
        end

        # @api private
        #
        # Builds up a complete Message object as streaming events arrive.
        #
        # @param event [Anthropic::Models::RawMessageStreamEvent] the raw streaming event to process
        # @param current_snapshot [Anthropic::Models::Message, nil] current accumulated message state
        #
        # @return [Anthropic::Models::Message] updated message snapshot with event applied
        private def accumulate_event(event:, current_snapshot:)
          unless event in Anthropic::Models::RawMessageStreamEvent
            message = "Expected event to be a variant of RawMessageStreamEvent, got #{event.class}"
            raise ArgumentError.new(message)
          end

          if current_snapshot.nil?
            return event.message if event.type == :message_start

            message = "Unexpected event order, got \"#{event.type}\" before \":message_start\""
            raise RuntimeError.new(message)
          end

          case event
          in Anthropic::Models::RawMessageStartEvent
            # Use the converter to create a new, isolated copy of the message object.
            # This ensures proper type validation and prevents shared object references
            # that could lead to unintended mutations during streaming accumulation.
            # Matches the Python SDK's approach of explicitly constructing Message objects.
            return Anthropic::Internal::Type::Converter.coerce(Anthropic::Models::Message, event.message)
          in Anthropic::Models::RawContentBlockStartEvent
            current_snapshot.content = (current_snapshot.content || []) + [event.content_block]
          in Anthropic::Models::RawContentBlockDeltaEvent
            content = current_snapshot.content[event.index]

            case (delta = event.delta)
            in Anthropic::Models::TextDelta if content.type == :text
              content.text += delta.text
            in Anthropic::Models::InputJSONDelta if content.type == :tool_use
              json_buf = content.json_buf.to_s
              json_buf += delta.partial_json

              content.input = json_buf
              content.json_buf = json_buf
            in Anthropic::Models::CitationsDelta if content.type == :text
              content.citations ||= []
              content.citations << delta.citation
            in Anthropic::Models::ThinkingDelta if content.type == :thinking
              content.thinking += delta.thinking
            in Anthropic::Models::SignatureDelta if content.type == :thinking
              content.signature = delta.signature
            else
            end
          in Anthropic::Models::RawMessageDeltaEvent
            current_snapshot.stop_reason = event.delta.stop_reason
            current_snapshot.stop_sequence = event.delta.stop_sequence
            current_snapshot.usage.output_tokens = event.usage.output_tokens
          else
          end

          current_snapshot
        end

        # @api private
        #
        # Determines which events to yield for a given raw streaming event.
        #
        # May transform events into higher-level types (TextEvent, InputJsonEvent),
        # pass through raw events unchanged, or produce multiple events.
        #
        # @param event [Anthropic::Models::RawMessageStreamEvent] the raw event to process
        # @param message_snapshot [Anthropic::Models::Message] current accumulated message state
        #
        # @return [Array<Object>] events to yield (mix of raw and typed events)
        private def build_events(event:, message_snapshot:)
          events_to_yield = []

          case event
          in Anthropic::Models::RawMessageStopEvent
            events_to_yield << MessageStopEvent.new(
              type: :message_stop,
              message: message_snapshot
            )
          in Anthropic::Models::RawContentBlockDeltaEvent
            events_to_yield << event
            content_block = message_snapshot.content[event.index]

            case (delta = event.delta)
            in Anthropic::Models::TextDelta if content_block.type == :text
              events_to_yield << Anthropic::Streaming::TextEvent.new(
                type: :text,
                text: delta.text,
                snapshot: content_block.text
              )
            in Anthropic::Models::InputJSONDelta if content_block.type == :tool_use
              events_to_yield << Anthropic::Streaming::InputJsonEvent.new(
                type: :input_json,
                partial_json: delta.partial_json,
                snapshot: content_block.input
              )
            in Anthropic::Models::CitationsDelta if content_block.type == :text
              events_to_yield << Anthropic::Streaming::CitationEvent.new(
                type: :citation,
                citation: delta.citation,
                snapshot: content_block.citations || []
              )
            in Anthropic::Models::ThinkingDelta if content_block.type == :thinking
              events_to_yield << Anthropic::Streaming::ThinkingEvent.new(
                type: :thinking,
                thinking: delta.thinking,
                snapshot: content_block.thinking
              )
            in Anthropic::Models::SignatureDelta if content_block.type == :thinking
              events_to_yield << Anthropic::Streaming::SignatureEvent.new(
                type: :signature,
                signature: content_block.signature
              )
            else
            end
          in Anthropic::Models::RawContentBlockStopEvent
            content_block = message_snapshot.content[event.index]

            events_to_yield << ContentBlockStopEvent.new(
              type: :content_block_stop,
              index: event.index,
              content_block: content_block
            )
          else
            events_to_yield << event
          end

          events_to_yield
        end

        # @api private
        #
        # Parse tool use blocks in the message using the provided tool models.
        #
        # @param message [Anthropic::Models::Message] The message to parse
        #
        # @return [Anthropic::Models::Message] The message with parsed tool uses
        private def parse_tool_uses!(message)
          return message unless message&.content

          message.content.each_with_index do |content, index|
            next unless content.type == :tool_use

            next unless (model = @tool_models[content.name])

            parsed =
              begin
                parsed_input = content.input.is_a?(String) ? JSON.parse(content.input) : content.input

                Anthropic::Internal::Type::Converter.coerce(model, parsed_input)
              rescue StandardError => e
                e
              end

            message.content[index] = Anthropic::Models::ToolUseBlock.new(
              id: content.id,
              input: content.input,
              name: content.name,
              type: content.type,
              parsed: parsed
            )
          end

          message
        end

        # @api private
        #
        # @param raw_stream [Anthropic::Internal::Type::BaseStream]
        # @param tool_models [Hash{String=>Class}] Mapping of tool names to model classes
        def initialize(raw_stream:, tool_models: {})
          # The underlying Server-Sent Event stream from the Anthropic API.
          @raw_stream = raw_stream
          # Accumulated message state that builds up as events are processed.
          @accumated_message_snapshot = nil
          # Mapping of tool names to model classes for parsing.
          @tool_models = tool_models
          # Lazy enumerable that transforms raw events into consumable events.
          @iterator = iterator
          @status = raw_stream.status
          @headers = raw_stream.headers
          @model = raw_stream.instance_variable_get(:@model)
        end
      end
    end
  end
end
