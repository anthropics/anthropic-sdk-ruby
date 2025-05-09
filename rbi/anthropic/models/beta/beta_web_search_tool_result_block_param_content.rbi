# typed: strong

module Anthropic
  module Models
    BetaWebSearchToolResultBlockParamContent =
      Beta::BetaWebSearchToolResultBlockParamContent

    module Beta
      module BetaWebSearchToolResultBlockParamContent
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              T::Array[Anthropic::Beta::BetaWebSearchResultBlockParam],
              Anthropic::Beta::BetaWebSearchToolRequestError
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaWebSearchToolResultBlockParamContent::Variants
            ]
          )
        end
        def self.variants
        end

        BetaWebSearchResultBlockParamArray =
          T.let(
            Anthropic::Internal::Type::ArrayOf[
              Anthropic::Beta::BetaWebSearchResultBlockParam
            ],
            Anthropic::Internal::Type::Converter
          )
      end
    end
  end
end
