# typed: strong

module Anthropic
  module Models
    class TextBlockParam < Anthropic::BaseModel
      sig { returns(String) }
      attr_accessor :text

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      attr_accessor :cache_control

      sig do
        returns(
          T.nilable(
            T::Array[T.any(
              Anthropic::Models::CitationCharLocationParam,
              Anthropic::Models::CitationPageLocationParam,
              Anthropic::Models::CitationContentBlockLocationParam
            )]
          )
        )
      end
      attr_accessor :citations

      sig do
        params(
          text: String,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          citations: T.nilable(
            T::Array[T.any(
              Anthropic::Models::CitationCharLocationParam,
              Anthropic::Models::CitationPageLocationParam,
              Anthropic::Models::CitationContentBlockLocationParam
            )]
          ),
          type: Symbol
        ).void
      end
      def initialize(text:, cache_control: nil, citations: nil, type: :text)
      end

      sig do
        override.returns(
          {
            text: String,
            type: Symbol,
            cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
            citations: T.nilable(
              T::Array[T.any(
                Anthropic::Models::CitationCharLocationParam,
                Anthropic::Models::CitationPageLocationParam,
                Anthropic::Models::CitationContentBlockLocationParam
              )]
            )
          }
        )
      end
      def to_hash
      end
    end
  end
end
