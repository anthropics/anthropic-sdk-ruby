# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    #
    # @example
    # ```ruby
    # case text_citation
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
    # case text_citation
    # in Anthropic::Models::CitationCharLocation
    #   # ...
    # in Anthropic::Models::CitationPageLocation
    #   # ...
    # in Anthropic::Models::CitationContentBlockLocation
    #   # ...
    # end
    # ```
    class TextCitation < Anthropic::Union
      discriminator :type

      variant :char_location, -> { Anthropic::Models::CitationCharLocation }

      variant :page_location, -> { Anthropic::Models::CitationPageLocation }

      variant :content_block_location, -> { Anthropic::Models::CitationContentBlockLocation }
    end
  end
end
