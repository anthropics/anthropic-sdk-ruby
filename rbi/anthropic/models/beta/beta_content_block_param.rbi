# typed: strong

module Anthropic
  module Models
    BetaContentBlockParam = Beta::BetaContentBlockParam

    module Beta
      module BetaContentBlockParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaTextBlockParam,
              Anthropic::Beta::BetaImageBlockParam,
              Anthropic::Beta::BetaToolUseBlockParam,
              Anthropic::Beta::BetaServerToolUseBlockParam,
              Anthropic::Beta::BetaWebSearchToolResultBlockParam,
              Anthropic::Beta::BetaToolResultBlockParam,
              Anthropic::Beta::BetaBase64PDFBlock,
              Anthropic::Beta::BetaThinkingBlockParam,
              Anthropic::Beta::BetaRedactedThinkingBlockParam
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
