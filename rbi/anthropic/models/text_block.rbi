# typed: strong

module Anthropic
  module Models
    class TextBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::TextBlock, Anthropic::Internal::AnyHash)
        end

      # Citations supporting the text block.
      #
      # The type of citation returned will depend on the type of document being cited.
      # Citing a PDF results in `page_location`, plain text results in `char_location`,
      # and content document results in `content_block_location`.
      sig { returns(T.nilable(T::Array[Anthropic::TextCitation::Variants])) }
      attr_accessor :citations

      sig { returns(String) }
      attr_accessor :text

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          citations:
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::CitationCharLocation::OrHash,
                  Anthropic::CitationPageLocation::OrHash,
                  Anthropic::CitationContentBlockLocation::OrHash,
                  Anthropic::CitationsWebSearchResultLocation::OrHash
                )
              ]
            ),
          text: String,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Citations supporting the text block.
        #
        # The type of citation returned will depend on the type of document being cited.
        # Citing a PDF results in `page_location`, plain text results in `char_location`,
        # and content document results in `content_block_location`.
        citations:,
        text:,
        type: :text
      )
      end

      sig do
        override.returns(
          {
            citations: T.nilable(T::Array[Anthropic::TextCitation::Variants]),
            text: String,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
