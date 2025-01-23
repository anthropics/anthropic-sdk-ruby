# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # text_block => {
    #   citations: -> { Anthropic::ArrayOf[union: Anthropic::Models::TextCitation] === _1 },
    #   text: String,
    #   type: Anthropic::Models::TextBlock::Type
    # }
    # ```
    class TextBlock < Anthropic::BaseModel
      # @!attribute citations
      #   Citations supporting the text block.
      #
      #     The type of citation returned will depend on the type of document being cited.
      #     Citing a PDF results in `page_location`, plain text results in `char_location`,
      #     and content document results in `content_block_location`.
      #
      #   @return [Array<Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation>]
      required :citations, -> { Anthropic::ArrayOf[union: Anthropic::Models::TextCitation] }, nil?: true

      # @!attribute text
      #
      #   @return [String]
      required :text, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::TextBlock::Type]
      required :type, enum: -> { Anthropic::Models::TextBlock::Type }

      # @!parse
      #   # @param citations [Array<Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation>]
      #   # @param text [String]
      #   # @param type [String]
      #   #
      #   def initialize(citations:, text:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case type
      # in :text
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        TEXT = :text

        finalize!
      end
    end
  end
end
