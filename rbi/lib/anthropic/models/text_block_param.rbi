# typed: strong

module Anthropic
  module Models
    class TextBlockParam < Anthropic::BaseModel
      sig { returns(String) }
      attr_accessor :text

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash))
        )
          .void
      end
      attr_writer :cache_control

      sig do
        returns(
          T.nilable(
            T::Array[
            T.any(
              Anthropic::Models::CitationCharLocationParam,
              Anthropic::Models::CitationPageLocationParam,
              Anthropic::Models::CitationContentBlockLocationParam
            )
            ]
          )
        )
      end
      attr_accessor :citations

      sig do
        params(
          text: String,
          cache_control: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash)),
          citations: T.nilable(
            T::Array[
            T.any(
              Anthropic::Models::CitationCharLocationParam,
              Anthropic::Util::AnyHash,
              Anthropic::Models::CitationPageLocationParam,
              Anthropic::Models::CitationContentBlockLocationParam
            )
            ]
          ),
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(text:, cache_control: nil, citations: nil, type: :text)
      end

      sig do
        override
          .returns(
            {
              text: String,
              type: Symbol,
              cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
              citations: T.nilable(
                T::Array[
                T.any(
                  Anthropic::Models::CitationCharLocationParam,
                  Anthropic::Models::CitationPageLocationParam,
                  Anthropic::Models::CitationContentBlockLocationParam
                )
                ]
              )
            }
          )
      end
      def to_hash
      end
    end
  end
end
