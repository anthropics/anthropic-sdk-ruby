# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_citations_delta => {
      #   citation: Anthropic::Models::Beta::BetaCitationsDelta::Citation,
      #   type: :citations_delta
      # }
      # ```
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

        # @example
        # ```ruby
        # case citation
        # in {type: "char_location", cited_text: String, document_index: Integer, document_title: String}
        #   # Anthropic::Models::Beta::BetaCitationCharLocation ...
        # in {type: "page_location", cited_text: String, document_index: Integer, document_title: String}
        #   # Anthropic::Models::Beta::BetaCitationPageLocation ...
        # in {type: "content_block_location", cited_text: String, document_index: Integer, document_title: String}
        #   # Anthropic::Models::Beta::BetaCitationContentBlockLocation ...
        # end
        # ```
        #
        # @example
        # ```ruby
        # case citation
        # in Anthropic::Models::Beta::BetaCitationCharLocation
        #   # ...
        # in Anthropic::Models::Beta::BetaCitationPageLocation
        #   # ...
        # in Anthropic::Models::Beta::BetaCitationContentBlockLocation
        #   # ...
        # end
        # ```
        class Citation < Anthropic::Union
          discriminator :type

          variant :char_location, -> { Anthropic::Models::Beta::BetaCitationCharLocation }

          variant :page_location, -> { Anthropic::Models::Beta::BetaCitationPageLocation }

          variant :content_block_location, -> { Anthropic::Models::Beta::BetaCitationContentBlockLocation }
        end
      end
    end

    BetaCitationsDelta = Beta::BetaCitationsDelta
  end
end
