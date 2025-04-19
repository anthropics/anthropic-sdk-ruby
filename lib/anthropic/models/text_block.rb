# frozen_string_literal: true

module Anthropic
  module Models
    class TextBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute citations
      #   Citations supporting the text block.
      #
      #   The type of citation returned will depend on the type of document being cited.
      #   Citing a PDF results in `page_location`, plain text results in `char_location`,
      #   and content document results in `content_block_location`.
      #
      #   @return [Array<Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation>, nil]
      required :citations,
               -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Models::TextCitation] },
               nil?: true

      # @!attribute text
      #
      #   @return [String]
      required :text, String

      # @!attribute type
      #
      #   @return [Symbol, :text]
      required :type, const: :text

      # @!method initialize(citations:, text:, type: :text)
      #   @param citations [Array<Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation>, nil]
      #   @param text [String]
      #   @param type [Symbol, :text]
    end
  end
end
