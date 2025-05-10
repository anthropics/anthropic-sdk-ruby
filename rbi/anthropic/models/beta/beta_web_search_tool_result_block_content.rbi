# typed: strong

module Anthropic
  module Models
    BetaWebSearchToolResultBlockContent =
      Beta::BetaWebSearchToolResultBlockContent

    module Beta
      module BetaWebSearchToolResultBlockContent
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebSearchToolResultError,
              T::Array[Anthropic::Beta::BetaWebSearchResultBlock]
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaWebSearchToolResultBlockContent::Variants
            ]
          )
        end
        def self.variants
        end

        BetaWebSearchResultBlockArray =
          T.let(
            Anthropic::Internal::Type::ArrayOf[
              Anthropic::Beta::BetaWebSearchResultBlock
            ],
            Anthropic::Internal::Type::Converter
          )
      end
    end
  end
end
