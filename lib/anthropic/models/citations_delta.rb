# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # citations_delta => {
    #   citation: Anthropic::Models::CitationsDelta::Citation,
    #   type: Anthropic::Models::CitationsDelta::Type
    # }
    # ```
    class CitationsDelta < Anthropic::BaseModel
      # @!attribute citation
      #
      #   @return [Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation]
      required :citation, union: -> { Anthropic::Models::CitationsDelta::Citation }

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::CitationsDelta::Type]
      required :type, enum: -> { Anthropic::Models::CitationsDelta::Type }

      # @!parse
      #   # @param citation [Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation]
      #   # @param type [String]
      #   #
      #   def initialize(citation:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case citation
      # in {type: "char_location", cited_text: String, document_index: Integer, document_title: String}
      #   # Anthropic::Models::CitationCharLocation ...
      # in {type: "page_location", cited_text: String, document_index: Integer, document_title: String}
      #   # Anthropic::Models::CitationPageLocation ...
      # in {type: "content_block_location", cited_text: String, document_index: Integer, document_title: String}
      #   # Anthropic::Models::CitationContentBlockLocation ...
      # end
      # ```
      #
      # @example
      # ```ruby
      # case citation
      # in Anthropic::Models::CitationCharLocation
      #   # ...
      # in Anthropic::Models::CitationPageLocation
      #   # ...
      # in Anthropic::Models::CitationContentBlockLocation
      #   # ...
      # end
      # ```
      class Citation < Anthropic::Union
        discriminator :type

        variant :char_location, -> { Anthropic::Models::CitationCharLocation }

        variant :page_location, -> { Anthropic::Models::CitationPageLocation }

        variant :content_block_location, -> { Anthropic::Models::CitationContentBlockLocation }
      end

      # @example
      # ```ruby
      # case type
      # in :citations_delta
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        CITATIONS_DELTA = :citations_delta

        finalize!
      end
    end
  end
end
