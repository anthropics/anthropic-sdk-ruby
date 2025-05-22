# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCitationsDelta < Anthropic::Internal::Type::BaseModel
        # @!attribute citation
        #
        #   @return [Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation, Anthropic::Models::Beta::BetaCitationsWebSearchResultLocation]
        required :citation, union: -> { Anthropic::Beta::BetaCitationsDelta::Citation }

        # @!attribute type
        #
        #   @return [Symbol, :citations_delta]
        required :type, const: :citations_delta

        # @!method initialize(citation:, type: :citations_delta)
        #   @param citation [Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation, Anthropic::Models::Beta::BetaCitationsWebSearchResultLocation]
        #   @param type [Symbol, :citations_delta]

        # @see Anthropic::Models::Beta::BetaCitationsDelta#citation
        module Citation
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
    end

    BetaCitationsDelta = Beta::BetaCitationsDelta
  end
end
