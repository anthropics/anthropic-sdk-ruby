# typed: strong

module Anthropic
  module Models
    module RawMessageStreamEvent
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::RawMessageStartEvent,
            Anthropic::RawMessageDeltaEvent,
            Anthropic::RawMessageStopEvent,
            Anthropic::RawContentBlockStartEvent,
            Anthropic::RawContentBlockDeltaEvent,
            Anthropic::RawContentBlockStopEvent
          )
        end

      module Type
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::RawMessageStreamEvent::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MESSAGE_START =
          T.let(
            :message_start,
            Anthropic::RawMessageStreamEvent::Type::TaggedSymbol
          )
        MESSAGE_DELTA =
          T.let(
            :message_delta,
            Anthropic::RawMessageStreamEvent::Type::TaggedSymbol
          )
        MESSAGE_STOP =
          T.let(
            :message_stop,
            Anthropic::RawMessageStreamEvent::Type::TaggedSymbol
          )
        CONTENT_BLOCK_START =
          T.let(
            :content_block_start,
            Anthropic::RawMessageStreamEvent::Type::TaggedSymbol
          )
        CONTENT_BLOCK_DELTA =
          T.let(
            :content_block_delta,
            Anthropic::RawMessageStreamEvent::Type::TaggedSymbol
          )
        CONTENT_BLOCK_STOP =
          T.let(
            :content_block_stop,
            Anthropic::RawMessageStreamEvent::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::RawMessageStreamEvent::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      sig do
        override.returns(T::Array[Anthropic::RawMessageStreamEvent::Variants])
      end
      def self.variants
      end

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          type: T.any(Symbol, String),
          message: Anthropic::Message::OrHash,
          delta:
            T.any(
              Anthropic::RawMessageDeltaEvent::Delta::OrHash,
              T.any(
                Anthropic::TextDelta::OrHash,
                Anthropic::InputJSONDelta::OrHash,
                Anthropic::CitationsDelta::OrHash,
                Anthropic::ThinkingDelta::OrHash,
                Anthropic::SignatureDelta::OrHash
              )
            ),
          usage: Anthropic::MessageDeltaUsage::OrHash,
          content_block:
            T.any(
              Anthropic::TextBlock::OrHash,
              Anthropic::ThinkingBlock::OrHash,
              Anthropic::RedactedThinkingBlock::OrHash,
              Anthropic::ToolUseBlock::OrHash,
              Anthropic::ServerToolUseBlock::OrHash,
              Anthropic::WebSearchToolResultBlock::OrHash,
              Anthropic::WebFetchToolResultBlock::OrHash,
              Anthropic::CodeExecutionToolResultBlock::OrHash,
              Anthropic::BashCodeExecutionToolResultBlock::OrHash,
              Anthropic::TextEditorCodeExecutionToolResultBlock::OrHash,
              Anthropic::ToolSearchToolResultBlock::OrHash,
              Anthropic::ContainerUploadBlock::OrHash
            ),
          index: Integer
        ).returns(Anthropic::RawMessageStreamEvent::Variants)
      end
      def self.new(
        type:,
        message: nil,
        delta: nil,
        # Billing and rate-limit usage.
        #
        # Anthropic's API bills and rate-limits by token counts, as tokens represent the
        # underlying cost to our systems.
        #
        # Under the hood, the API transforms requests into a format suitable for the
        # model. The model's output then goes through a parsing stage before becoming an
        # API response. As a result, the token counts in `usage` will not match one-to-one
        # with the exact visible content of an API request or response.
        #
        # For example, `output_tokens` will be non-zero, even for an empty string response
        # from Claude.
        #
        # Total input tokens in a request is the summation of `input_tokens`,
        # `cache_creation_input_tokens`, and `cache_read_input_tokens`.
        usage: nil,
        # Response model for a file uploaded to the container.
        content_block: nil,
        index: nil
      )
      end
    end
  end
end
