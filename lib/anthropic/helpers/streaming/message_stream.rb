# frozen_string_literal: true

module Anthropic
  module Helpers
    module Streaming
      # @api private
      #
      # @generic Elem
      class MessageStream
        include Anthropic::Internal::Type::BaseStream

        # @api private
        #
        # @return [Enumerable<generic<Elem>>]
        private def iterator
          @iterator ||= Anthropic::Internal::Util.chain_fused(@stream) do |y|
            @raw_stream.each do |raw_event|
              @accumated_message_snapshot = accumulate_event(
                event: raw_event,
                current_snapshot: @accumated_message_snapshot
              )
              events_to_fire = build_events(event: raw_event, message_snapshot: @accumated_message_snapshot)
              events_to_fire.each(&y)
            end
          end
        end

        # @api public
        #
        # Blocks until the stream has been consumed
        #
        # return [void]
        def until_done = each {} # rubocop:disable Lint/EmptyBlock

        # @api public
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

        # Waits until the stream has been read to completion and returns
        # the accumulated `Message` object.
        #
        # @return [Anthropic::Models::Message]
        def accumulated_message
          until_done
          @accumated_message_snapshot
        end

        # Returns all `text` content blocks concatenated together.
        #
        # NOTE: Currently the API will only respond with a single content block.
        #
        # Will raise an error if no `text` content blocks were returned.
        #
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
        # @param event [Anthropic::Streaming::RawMessageEvent]
        # @param current_snapshot [Anthropic::Models::Message, nil]
        #
        # returns [Anthropic::Models::Message]
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
            current_snapshot.content = if current_snapshot.content.nil?
              [event.content_block]
            else
              current_snapshot.content.dup + [event.content_block]
            end
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

            # The current_snapshot.content array can't be updated in place so we need to duplicate,
            # merge, and replace.
            all_content = current_snapshot.content.dup
            all_content[event.index] = content
            current_snapshot.content = all_content
          in Anthropic::Models::RawMessageDeltaEvent
            current_snapshot.stop_reason = event.delta.stop_reason
            current_snapshot.stop_sequence = event.delta.stop_sequence
            current_snapshot.usage.output_tokens = event.usage.output_tokens
          else
          end

          current_snapshot
        end

        private def build_events(event:, message_snapshot:)
          events_to_fire = []

          case event
          in Anthropic::Models::RawMessageStopEvent
            events_to_fire << MessageStopEvent.new(
              type: :message_stop,
              message: message_snapshot
            )
          in Anthropic::Models::RawContentBlockDeltaEvent
            events_to_fire << event
            content_block = message_snapshot.content[event.index]

            case (delta = event.delta)
            in Anthropic::Models::TextDelta if content_block.type == :text
              events_to_fire << Anthropic::Streaming::TextEvent.new(
                type: :text,
                text: delta.text,
                snapshot: content_block.text
              )
            in Anthropic::Models::InputJSONDelta if content_block.type == :tool_use
              events_to_fire << Anthropic::Streaming::InputJsonEvent.new(
                type: :input_json,
                partial_json: delta.partial_json,
                snapshot: content_block.input
              )
            in Anthropic::Models::CitationsDelta if content_block.type == :text
              events_to_fire << Anthropic::Streaming::CitationEvent.new(
                type: :citation,
                citation: delta.citation,
                snapshot: content_block.citations || []
              )
            in Anthropic::Models::ThinkingDelta if content_block.type == :thinking
              events_to_fire << Anthropic::Streaming::ThinkingEvent.new(
                type: :thinking,
                thinking: delta.thinking,
                snapshot: content_block.thinking
              )
            in Anthropic::Models::SignatureDelta if content_block.type == :thinking
              events_to_fire << Anthropic::Streaming::SignatureEvent.new(
                type: :signature,
                signature: content_block.signature
              )
            else
            end
          in Anthropic::Models::RawContentBlockStopEvent
            content_block = message_snapshot.content[event.index]

            events_to_fire << ContentBlockStopEvent.new(
              type: :content_block_stop,
              index: event.index,
              content_block: content_block
            )
          else
            events_to_fire << event
          end

          events_to_fire
        end

        # @api private
        #
        # @param raw_stream [Anthropic::Internal::Type::BaseStream]
        def initialize(raw_stream:)
          @raw_stream = raw_stream
          @accumated_message_snapshot = nil
          @iterator = iterator
        end
      end
    end
  end
end
