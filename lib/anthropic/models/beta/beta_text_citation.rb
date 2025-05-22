# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaTextCitation
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :char_location, -> { Anthropic::Beta::BetaCitationCharLocation }

        variant :page_location, -> { Anthropic::Beta::BetaCitationPageLocation }

        variant :content_block_location, -> { Anthropic::Beta::BetaCitationContentBlockLocation }

        variant :web_search_result_location, -> { Anthropic::Beta::BetaCitationsWebSearchResultLocation }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation, Anthropic::Models::Beta::BetaCitationsWebSearchResultLocation)]
      end
    end

    BetaTextCitation = Beta::BetaTextCitation
  end
end
