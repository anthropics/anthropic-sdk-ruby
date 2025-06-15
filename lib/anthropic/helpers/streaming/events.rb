# frozen_string_literal: true

module Anthropic
  module Helpers
    module Streaming
      class TextEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :text]
        required :type, const: :text

        # @!attribute text
        #   The text delta received in this streaming event.
        #
        #   @return [String]
        required :text, String

        # @!attribute snapshot
        #   The entire accumulated text up to this point in the stream.
        #
        #   @return [String]
        required :snapshot, String
      end

      class CitationEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :citation]
        required :type, const: :citation

        # @!attribute citation
        #   The new citation received in this streaming event.
        #
        #   @return [Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation, Anthropic::Models::CitationsWebSearchResultLocation]
        required :citation, union: -> { Anthropic::CitationsDelta::Citation }

        # @!attribute snapshot
        #   All of the accumulated citations up to this point in the stream.
        #
        #   @return [Array<Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation, Anthropic::Models::CitationsWebSearchResultLocation>]
        required :snapshot,
                 -> {
                   Anthropic::Internal::Type::ArrayOf[union: Anthropic::CitationsDelta::Citation]
                 }
      end

      class ThinkingEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :thinking]
        required :type, const: :thinking

        # @!attribute thinking
        #   The thinking delta received in this streaming event.
        #
        #   @return [String]
        required :thinking, String

        # @!attribute snapshot
        #   The accumulated thinking content up to this point in the stream.
        #
        #   @return [String]
        required :snapshot, String
      end

      class SignatureEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :signature]
        required :type, const: :signature

        # @!attribute signature
        #   The signature of the thinking block.
        #
        #   @return [String]
        required :signature, String
      end

      class InputJsonEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :input_json]
        required :type, const: :input_json

        # @!attribute partial_json
        #   A partial JSON string delta received in this streaming event.
        #
        #   Example:
        #   ```
        #   "{'location':,"
        #   ```
        #
        #   @return [String]
        required :partial_json, String

        # @!attribute snapshot
        #   The currently accumulated parsed object up to this point in the stream.
        #
        #   Example:
        #   ```
        #   {'location': 'San Francisco, CA'}
        #   ```
        #
        #   @return [Object]
        required :snapshot, Anthropic::Internal::Type::Unknown
      end

      class MessageStopEvent < Anthropic::Models::RawMessageStopEvent
        # @!attribute type
        #
        #   @return [Symbol, :message_stop]
        required :type, const: :message_stop

        # @!attribute message
        #   The completed message when streaming ends.
        #
        #   @return [Anthropic::Models::Message]
        required :message, Anthropic::Models::Message
      end

      class ContentBlockStopEvent < Anthropic::Models::RawContentBlockStopEvent
        # @!attribute index
        #   The index of the content block that has stopped streaming.
        #
        #   @return [Integer]
        required :index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :content_block_stop]
        required :type, const: :content_block_stop

        # @!attribute content_block
        #   The completed content block when streaming for this block ends.
        #
        #   @return [Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock]
        required :content_block, Anthropic::Models::ContentBlock
      end
    end
  end
end
