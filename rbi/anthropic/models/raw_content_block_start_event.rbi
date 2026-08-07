# typed: strong

module Anthropic
  module Models
    class RawContentBlockStartEvent < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::RawContentBlockStartEvent,
            Anthropic::Internal::AnyHash
          )
        end

      # Response model for a file uploaded to the container.
      sig do
        returns(Anthropic::RawContentBlockStartEvent::ContentBlock::Variants)
      end
      attr_accessor :content_block

      sig { returns(Integer) }
      attr_accessor :index

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
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
          index: Integer,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Response model for a file uploaded to the container.
        content_block:,
        index:,
        type: :content_block_start
      )
      end

      sig do
        override.returns(
          {
            content_block:
              Anthropic::RawContentBlockStartEvent::ContentBlock::Variants,
            index: Integer,
            type: Symbol
          }
        )
      end
      def to_hash
      end

      # Response model for a file uploaded to the container.
      module ContentBlock
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::TextBlock,
              Anthropic::ThinkingBlock,
              Anthropic::RedactedThinkingBlock,
              Anthropic::ToolUseBlock,
              Anthropic::ServerToolUseBlock,
              Anthropic::WebSearchToolResultBlock,
              Anthropic::WebFetchToolResultBlock,
              Anthropic::CodeExecutionToolResultBlock,
              Anthropic::BashCodeExecutionToolResultBlock,
              Anthropic::TextEditorCodeExecutionToolResultBlock,
              Anthropic::ToolSearchToolResultBlock,
              Anthropic::ContainerUploadBlock
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::RawContentBlockStartEvent::ContentBlock::Variants
            ]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            citations:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::CitationCharLocation::OrHash,
                    Anthropic::CitationPageLocation::OrHash,
                    Anthropic::CitationContentBlockLocation::OrHash,
                    Anthropic::CitationsWebSearchResultLocation::OrHash,
                    Anthropic::CitationsSearchResultLocation::OrHash
                  )
                ]
              ),
            text: String,
            signature: String,
            thinking: String,
            data: String,
            id: String,
            caller_:
              T.any(
                Anthropic::DirectCaller::OrHash,
                Anthropic::ServerToolCaller::OrHash,
                Anthropic::ServerToolCaller20260120::OrHash
              ),
            input: T::Hash[Symbol, T.anything],
            name: T.any(String, Anthropic::ServerToolUseBlock::Name::OrSymbol),
            content:
              T.any(
                T.any(
                  Anthropic::WebSearchToolResultError::OrHash,
                  T::Array[Anthropic::WebSearchResultBlock::OrHash]
                ),
                T.any(
                  Anthropic::WebFetchToolResultErrorBlock::OrHash,
                  Anthropic::WebFetchBlock::OrHash
                ),
                T.any(
                  Anthropic::CodeExecutionToolResultError::OrHash,
                  Anthropic::CodeExecutionResultBlock::OrHash,
                  Anthropic::EncryptedCodeExecutionResultBlock::OrHash
                ),
                T.any(
                  Anthropic::BashCodeExecutionToolResultError::OrHash,
                  Anthropic::BashCodeExecutionResultBlock::OrHash
                ),
                T.any(
                  Anthropic::TextEditorCodeExecutionToolResultError::OrHash,
                  Anthropic::TextEditorCodeExecutionViewResultBlock::OrHash,
                  Anthropic::TextEditorCodeExecutionCreateResultBlock::OrHash,
                  Anthropic::TextEditorCodeExecutionStrReplaceResultBlock::OrHash
                ),
                T.any(
                  Anthropic::ToolSearchToolResultError::OrHash,
                  Anthropic::ToolSearchToolSearchResultBlock::OrHash
                )
              ),
            tool_use_id: String,
            file_id: String
          ).returns(
            Anthropic::RawContentBlockStartEvent::ContentBlock::Variants
          )
        end
        def self.new(
          type:,
          # Citations supporting the text block.
          #
          # The type of citation returned will depend on the type of document being cited.
          # Citing a PDF results in `page_location`, plain text results in `char_location`,
          # and content document results in `content_block_location`.
          citations: nil,
          text: nil,
          # A value used to verify that this thinking block was generated by Claude when it
          # is passed back to the API.
          #
          # This is an opaque field and should not be interpreted or parsed. When passing
          # thinking blocks back to the API (required when using tools with extended
          # thinking), pass them back exactly as received, with this field intact.
          #
          # See
          # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking)
          # for details.
          signature: nil,
          # The text of Claude's thinking process for this block.
          thinking: nil,
          # The contents of this redacted thinking block, returned when portions of the
          # model's thinking were safety-redacted. This field is opaque and encrypted, with
          # no readable content.
          #
          # Pass `redacted_thinking` blocks back to the API unchanged when continuing a
          # multi-turn conversation.
          #
          # See
          # [extended thinking](https://platform.claude.com/docs/en/build-with-claude/extended-thinking#redacted-thinking-blocks)
          # for details.
          data: nil,
          id: nil,
          # Tool invocation directly from the model.
          caller_: nil,
          input: nil,
          name: nil,
          # Code execution result with encrypted stdout for PFC + web_search results.
          content: nil,
          tool_use_id: nil,
          file_id: nil
        )
        end
      end
    end
  end
end
