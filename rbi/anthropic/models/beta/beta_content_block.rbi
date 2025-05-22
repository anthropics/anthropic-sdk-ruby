# typed: strong

module Anthropic
  module Models
    BetaContentBlock = Beta::BetaContentBlock

    module Beta
      # Response model for a file uploaded to the container.
      module BetaContentBlock
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextBlock,
              Anthropic::Beta::BetaToolUseBlock,
              Anthropic::Beta::BetaServerToolUseBlock,
              Anthropic::Beta::BetaWebSearchToolResultBlock,
              Anthropic::Beta::BetaCodeExecutionToolResultBlock,
              Anthropic::Beta::BetaMCPToolUseBlock,
              Anthropic::Beta::BetaMCPToolResultBlock,
              Anthropic::Beta::BetaContainerUploadBlock,
              Anthropic::Beta::BetaThinkingBlock,
              Anthropic::Beta::BetaRedactedThinkingBlock
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaContentBlock::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
