# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaTextCitationParam
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :char_location, -> { Anthropic::Beta::BetaCitationCharLocationParam }

        variant :page_location, -> { Anthropic::Beta::BetaCitationPageLocationParam }

        variant :content_block_location, -> { Anthropic::Beta::BetaCitationContentBlockLocationParam }

        variant :web_search_result_location, -> { Anthropic::Beta::BetaCitationWebSearchResultLocationParam }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam, Anthropic::Models::Beta::BetaCitationWebSearchResultLocationParam)]
      end
    end

    BetaTextCitationParam = Beta::BetaTextCitationParam
  end
end
