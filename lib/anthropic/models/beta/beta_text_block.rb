# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute citations
        #   Citations supporting the text block.
        #
        #   The type of citation returned will depend on the type of document being cited.
        #   Citing a PDF results in `page_location`, plain text results in `char_location`,
        #   and content document results in `content_block_location`.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation, Anthropic::Models::Beta::BetaCitationsWebSearchResultLocation>, nil]
        required :citations,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaTextCitation] },
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
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaTextBlock} for more details.
        #
        #   @param citations [Array<Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation, Anthropic::Models::Beta::BetaCitationsWebSearchResultLocation>, nil] Citations supporting the text block.
        #
        #   @param text [String]
        #
        #   @param type [Symbol, :text]
      end
    end

    BetaTextBlock = Beta::BetaTextBlock
  end
end
