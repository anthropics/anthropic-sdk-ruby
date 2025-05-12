# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaWebSearchToolResultBlockParamContent
        extend Anthropic::Internal::Type::Union

        variant -> {
          Anthropic::Beta::BetaWebSearchToolResultBlockParamContent::BetaWebSearchResultBlockParamArray
        }

        variant -> { Anthropic::Beta::BetaWebSearchToolRequestError }

        # @!method self.variants
        #   @return [Array(Array<Anthropic::Beta::BetaWebSearchResultBlockParam>, Anthropic::Beta::BetaWebSearchToolRequestError)]

        define_sorbet_constant!(:Variants) do
          T.type_alias do
            T.any(
              T::Array[Anthropic::Beta::BetaWebSearchResultBlockParam],
              Anthropic::Beta::BetaWebSearchToolRequestError
            )
          end
        end

        # @type [Anthropic::Internal::Type::Converter]
        BetaWebSearchResultBlockParamArray =
          Anthropic::Internal::Type::ArrayOf[-> { Anthropic::Beta::BetaWebSearchResultBlockParam }]
      end
    end

    BetaWebSearchToolResultBlockParamContent = Beta::BetaWebSearchToolResultBlockParamContent
  end
end
