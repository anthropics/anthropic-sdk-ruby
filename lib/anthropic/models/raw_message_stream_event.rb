# frozen_string_literal: true

module Anthropic
  module Models
    module RawMessageStreamEvent
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :message_start, -> { Anthropic::RawMessageStartEvent }

      variant :message_delta, -> { Anthropic::RawMessageDeltaEvent }

      variant :message_stop, -> { Anthropic::RawMessageStopEvent }

      variant :content_block_start, -> { Anthropic::RawContentBlockStartEvent }

      variant :content_block_delta, -> { Anthropic::RawContentBlockDeltaEvent }

      variant :content_block_stop, -> { Anthropic::RawContentBlockStopEvent }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::RawMessageStartEvent, Anthropic::Models::RawMessageDeltaEvent, Anthropic::Models::RawMessageStopEvent, Anthropic::Models::RawContentBlockStartEvent, Anthropic::Models::RawContentBlockDeltaEvent, Anthropic::Models::RawContentBlockStopEvent)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::RawMessageStreamEvent} for more details.
      #
      # @param type [Symbol, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [Anthropic::Models::Message] :message
      #
      #   @option args [Anthropic::Models::RawMessageDeltaEvent::Delta, Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta, Anthropic::Models::CitationsDelta, Anthropic::Models::ThinkingDelta, Anthropic::Models::SignatureDelta] :delta
      #
      #   @option args [Anthropic::Models::MessageDeltaUsage] :usage Billing and rate-limit usage.
      #
      #   @option args [Anthropic::Models::TextBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ServerToolUseBlock, Anthropic::Models::WebSearchToolResultBlock, Anthropic::Models::WebFetchToolResultBlock, Anthropic::Models::CodeExecutionToolResultBlock, Anthropic::Models::BashCodeExecutionToolResultBlock, Anthropic::Models::TextEditorCodeExecutionToolResultBlock, Anthropic::Models::ToolSearchToolResultBlock, Anthropic::Models::ContainerUploadBlock] :content_block Response model for a file uploaded to the container.
      #
      #   @option args [Integer] :index
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::RawMessageStartEvent, Anthropic::Models::RawMessageDeltaEvent, Anthropic::Models::RawMessageStopEvent, Anthropic::Models::RawContentBlockStartEvent, Anthropic::Models::RawContentBlockDeltaEvent, Anthropic::Models::RawContentBlockStopEvent]
      def self.new(type:, **args)
        case type.to_sym
        when :message_start
          Anthropic::RawMessageStartEvent.new(**args)
        when :message_delta
          Anthropic::RawMessageDeltaEvent.new(**args)
        when :message_stop
          Anthropic::RawMessageStopEvent.new(**args)
        when :content_block_start
          Anthropic::RawContentBlockStartEvent.new(**args)
        when :content_block_delta
          Anthropic::RawContentBlockDeltaEvent.new(**args)
        when :content_block_stop
          Anthropic::RawContentBlockStopEvent.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
