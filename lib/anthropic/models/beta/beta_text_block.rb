# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_text_block => {
      #   citations: -> { Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaTextCitation] === _1 },
      #   text: String,
      #   type: Anthropic::Models::Beta::BetaTextBlock::Type
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
        #   @return [Symbol, Anthropic::Models::Beta::BetaTextBlock::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaTextBlock::Type }

        # @!parse
        #   # @param citations [Array<Anthropic::Models::Beta::BetaCitationCharLocation, Anthropic::Models::Beta::BetaCitationPageLocation, Anthropic::Models::Beta::BetaCitationContentBlockLocation>]
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

    BetaTextBlock = Beta::BetaTextBlock
  end
end
