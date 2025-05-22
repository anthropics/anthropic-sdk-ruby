# typed: strong

module Anthropic
  module Models
    BetaContentBlockParam = Beta::BetaContentBlockParam

    module Beta
      # Regular text content.
      module BetaContentBlockParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaServerToolUseBlockParam,
              Anthropic::Beta::BetaWebSearchToolResultBlockParam,
              Anthropic::Beta::BetaCodeExecutionToolResultBlockParam,
              Anthropic::Beta::BetaMCPToolUseBlockParam,
              Anthropic::Beta::BetaRequestMCPToolResultBlockParam,
              Anthropic::Beta::BetaTextBlockParam,
              Anthropic::Beta::BetaImageBlockParam,
              Anthropic::Beta::BetaToolUseBlockParam,
              Anthropic::Beta::BetaToolResultBlockParam,
              Anthropic::Beta::BetaBase64PDFBlock,
              Anthropic::Beta::BetaThinkingBlockParam,
              Anthropic::Beta::BetaRedactedThinkingBlockParam,
              Anthropic::Beta::BetaContainerUploadBlockParam
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaContentBlockParam::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
