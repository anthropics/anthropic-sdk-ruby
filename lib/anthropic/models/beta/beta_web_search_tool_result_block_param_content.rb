# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaWebSearchToolResultBlockParamContent
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::Models::Beta::BetaWebSearchToolResultBlockParamContent::BetaWebSearchResultBlockParamArray }

        variant -> { Anthropic::Beta::BetaWebSearchToolRequestError }

        # @!method self.variants
        #   @return [Array(Array<Anthropic::Models::Beta::BetaWebSearchResultBlockParam>, Anthropic::Models::Beta::BetaWebSearchToolRequestError)]

        # @type [Anthropic::Internal::Type::Converter]
        BetaWebSearchResultBlockParamArray =
          Anthropic::Internal::Type::ArrayOf[-> { Anthropic::Beta::BetaWebSearchResultBlockParam }]
      end
    end

    BetaWebSearchToolResultBlockParamContent = Beta::BetaWebSearchToolResultBlockParamContent
  end
end
