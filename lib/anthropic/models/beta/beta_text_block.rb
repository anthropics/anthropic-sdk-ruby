# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute citations
        #   Citations supporting the text block.
        #
        #     The type of citation returned will depend on the type of document being cited.
        #     Citing a PDF results in `page_location`, plain text results in `char_location`,
        #     and content document results in `content_block_location`.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation>, nil]
        required :citations,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Models::Beta::BetaTextCitation] },
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
        #   # @param citations [Array<Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation>, nil]
        #   # @param text [String]
        #   # @param type [Symbol, :text]
        #   #
        #   def initialize(citations:, text:, type: :text, **) = super

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
      end
    end

    BetaTextBlock = Beta::BetaTextBlock
  end
end
