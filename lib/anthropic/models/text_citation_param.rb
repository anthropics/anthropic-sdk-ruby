# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # case text_citation_param
    # in {type: "char_location", cited_text: String, document_index: Integer, document_title: String}
    #   # Anthropic::Models::CitationCharLocationParam ...
    # in {type: "page_location", cited_text: String, document_index: Integer, document_title: String}
    #   # Anthropic::Models::CitationPageLocationParam ...
    # in {type: "content_block_location", cited_text: String, document_index: Integer, document_title: String}
    #   # Anthropic::Models::CitationContentBlockLocationParam ...
    # end
    # ```
    #
    # @example
    # ```ruby
    # case text_citation_param
    # in Anthropic::Models::CitationCharLocationParam
    #   # ...
    # in Anthropic::Models::CitationPageLocationParam
    #   # ...
    # in Anthropic::Models::CitationContentBlockLocationParam
    #   # ...
    # end
    # ```
    class TextCitationParam < Anthropic::Union
      discriminator :type

      variant :char_location, -> { Anthropic::Models::CitationCharLocationParam }

      variant :page_location, -> { Anthropic::Models::CitationPageLocationParam }

      variant :content_block_location, -> { Anthropic::Models::CitationContentBlockLocationParam }
    end
  end
end
