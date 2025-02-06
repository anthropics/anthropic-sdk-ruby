# typed: strong

module Anthropic
  module Models
    class TextBlock < Anthropic::BaseModel
      sig do
        returns(
          T.nilable(
            T::Array[T.any(
              Anthropic::Models::CitationCharLocation,
              Anthropic::Models::CitationPageLocation,
              Anthropic::Models::CitationContentBlockLocation
            )]
          )
        )
      end
      attr_accessor :citations

      sig { returns(String) }
      attr_accessor :text

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          citations: T.nilable(
            T::Array[T.any(
              Anthropic::Models::CitationCharLocation,
              Anthropic::Models::CitationPageLocation,
              Anthropic::Models::CitationContentBlockLocation
            )]
          ),
          text: String,
          type: Symbol
        ).void
      end
      def initialize(citations:, text:, type: :text)
      end

      sig do
        override.returns(
          {
            citations: T.nilable(
              T::Array[T.any(
                Anthropic::Models::CitationCharLocation,
                Anthropic::Models::CitationPageLocation,
                Anthropic::Models::CitationContentBlockLocation
              )]
            ),
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
