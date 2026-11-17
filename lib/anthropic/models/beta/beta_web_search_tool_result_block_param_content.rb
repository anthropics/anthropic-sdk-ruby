# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaWebSearchToolResultBlockParamContent
        extend Anthropic::Internal::Type::Union

        variant -> { Anthropic::Beta::BetaWebSearchToolRequestErrorObject }

        variant -> { Anthropic::Models::Beta::BetaWebSearchToolResultBlockParamContent::BetaWebSearchResultBlockParamArray }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaWebSearchToolRequestErrorObject, Array<Anthropic::Models::Beta::BetaWebSearchResultBlockParam>)]

        # @type [Anthropic::Internal::Type::Converter]
        BetaWebSearchResultBlockParamArray =
          Anthropic::Internal::Type::ArrayOf[-> { Anthropic::Beta::BetaWebSearchResultBlockParam }]
      end
    end

    BetaWebSearchToolResultBlockParamContent = Beta::BetaWebSearchToolResultBlockParamContent
  end
end
