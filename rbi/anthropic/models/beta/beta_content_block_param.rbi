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
              Anthropic::Beta::BetaTextBlockParam,
              Anthropic::Beta::BetaImageBlockParam,
              Anthropic::Beta::BetaRequestDocumentBlock,
              Anthropic::Beta::BetaSearchResultBlockParam,
              Anthropic::Beta::BetaThinkingBlockParam,
              Anthropic::Beta::BetaRedactedThinkingBlockParam,
              Anthropic::Beta::BetaToolUseBlockParam,
              Anthropic::Beta::BetaToolResultBlockParam,
              Anthropic::Beta::BetaServerToolUseBlockParam,
              Anthropic::Beta::BetaWebSearchToolResultBlockParam,
              Anthropic::Beta::BetaWebFetchToolResultBlockParam,
              Anthropic::Beta::BetaCodeExecutionToolResultBlockParam,
              Anthropic::Beta::BetaBashCodeExecutionToolResultBlockParam,
              Anthropic::Beta::BetaTextEditorCodeExecutionToolResultBlockParam,
              Anthropic::Beta::BetaToolSearchToolResultBlockParam,
              Anthropic::Beta::BetaMCPToolUseBlockParam,
              Anthropic::Beta::BetaRequestMCPToolResultBlockParam,
              Anthropic::Beta::BetaContainerUploadBlockParam,
              Anthropic::Beta::BetaCompactionBlockParam
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
