# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_text_block => {
      #   citations: -> { Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaTextCitation] === _1 },
      #   text: String,
      #   type: :text
      # }
      # ```
      class BetaTextBlock < Anthropic::BaseModel
        # @!attribute citations
        #   Citations supporting the text block.
        #
        #     The type of citation returned will depend on the type of document being cited.
        #     Citing a PDF results in `page_location`, plain text results in `char_location`,
        #     and content document results in `content_block_location`.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation>]
        required :citations,
                 -> { Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaTextCitation] },
                 nil?: true

        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, :text]
        required :type, const: :text

        # @!parse
        #   # @param citations [Array<Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation>]
        #   # @param text [String]
        #   # @param type [String]
        #   #
        #   def initialize(citations:, text:, type: :text, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaTextBlock = Beta::BetaTextBlock
  end
end
