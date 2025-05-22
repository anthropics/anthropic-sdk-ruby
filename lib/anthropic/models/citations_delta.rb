# frozen_string_literal: true

module Anthropic
  module Models
    class CitationsDelta < Anthropic::Internal::Type::BaseModel
      # @!attribute citation
      #
      #   @return [Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation, Anthropic::Models::CitationsWebSearchResultLocation]
      required :citation, union: -> { Anthropic::CitationsDelta::Citation }

      # @!attribute type
      #
      #   @return [Symbol, :citations_delta]
      required :type, const: :citations_delta

      # @!method initialize(citation:, type: :citations_delta)
      #   @param citation [Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation, Anthropic::Models::CitationsWebSearchResultLocation]
      #   @param type [Symbol, :citations_delta]

      # @see Anthropic::Models::CitationsDelta#citation
      module Citation
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :char_location, -> { Anthropic::CitationCharLocation }

        variant :page_location, -> { Anthropic::CitationPageLocation }

        variant :content_block_location, -> { Anthropic::CitationContentBlockLocation }

        variant :web_search_result_location, -> { Anthropic::CitationsWebSearchResultLocation }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation, Anthropic::Models::CitationsWebSearchResultLocation)]
      end
    end
  end
end
