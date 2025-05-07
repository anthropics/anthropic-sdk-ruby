# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCitationsDelta < Anthropic::Internal::Type::BaseModel
        # @!attribute citation
        #
        #   @return [Anthropic::Beta::BetaCitationCharLocation, Anthropic::Beta::BetaCitationPageLocation, Anthropic::Beta::BetaCitationContentBlockLocation]
        required :citation, union: -> { Anthropic::Beta::BetaCitationsDelta::Citation }

        # @!attribute type
        #
        #   @return [Symbol, :citations_delta]
        required :type, const: :citations_delta

        # @!method initialize(citation:, type: :citations_delta)
        #   @param citation [Anthropic::Beta::BetaCitationCharLocation, Anthropic::Beta::BetaCitationPageLocation, Anthropic::Beta::BetaCitationContentBlockLocation]
        #   @param type [Symbol, :citations_delta]

        # @see Anthropic::Beta::BetaCitationsDelta#citation
        module Citation
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :char_location, -> { Anthropic::Beta::BetaCitationCharLocation }

          variant :page_location, -> { Anthropic::Beta::BetaCitationPageLocation }

          variant :content_block_location, -> { Anthropic::Beta::BetaCitationContentBlockLocation }

          # @!method self.variants
          #   @return [Array(Anthropic::Beta::BetaCitationCharLocation, Anthropic::Beta::BetaCitationPageLocation, Anthropic::Beta::BetaCitationContentBlockLocation)]
        end
      end
    end

    BetaCitationsDelta = Beta::BetaCitationsDelta
  end
end
