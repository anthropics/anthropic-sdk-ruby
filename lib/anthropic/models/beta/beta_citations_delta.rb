# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCitationsDelta < Anthropic::BaseModel
        # @!attribute citation
        #
        #   @return [Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation]
        required :citation, union: -> { Anthropic::Models::Beta::BetaCitationsDelta::Citation }

        # @!attribute type
        #
        #   @return [Symbol, :citations_delta]
        required :type, const: :citations_delta

        # @!parse
        #   # @param citation [Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation]
        #   # @param type [Symbol, :citations_delta]
        #   #
        #   def initialize(citation:, type: :citations_delta, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @abstract
        class Citation < Anthropic::Union
          discriminator :type

          variant :char_location, -> { Anthropic::Models::Beta::BetaCitationCharLocation }

          variant :page_location, -> { Anthropic::Models::Beta::BetaCitationPageLocation }

          variant :content_block_location, -> { Anthropic::Models::Beta::BetaCitationContentBlockLocation }

          # @!parse
          #   class << self
          #     # @return [Array(Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation)]
          #     def variants; end
          #   end
        end
      end
    end

    BetaCitationsDelta = Beta::BetaCitationsDelta
  end
end
