# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaWebSearchToolResultBlockContent
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::Beta::BetaWebSearchToolResultError }

        variant -> { Anthropic::Beta::BetaWebSearchToolResultBlockContent::BetaWebSearchResultBlockArray }

        # @!method self.variants
        #   @return [Array(Anthropic::Beta::BetaWebSearchToolResultError, Array<Anthropic::Beta::BetaWebSearchResultBlock>)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebSearchToolResultError,
              T::Array[Anthropic::Beta::BetaWebSearchResultBlock]
            )
          end
        end

        # @type [Anthropic::Internal::Type::Converter]
        BetaWebSearchResultBlockArray =
          Anthropic::Internal::Type::ArrayOf[-> { Anthropic::Beta::BetaWebSearchResultBlock }]
      end
    end

    BetaWebSearchToolResultBlockContent = Beta::BetaWebSearchToolResultBlockContent
  end
end
