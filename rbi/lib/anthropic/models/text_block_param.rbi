# typed: strong

module Anthropic
  module Models
    class TextBlockParam < Anthropic::BaseModel
      sig { returns(String) }
      def text
      end

      sig { params(_: String).returns(String) }
      def text=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      def cache_control
      end

      sig do
        params(_: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash)))
          .returns(T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash)))
      end
      def cache_control=(_)
      end

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
      def citations
      end

      sig do
        params(
          _: T.nilable(
            T::Array[
            T.any(
              Anthropic::Models::CitationCharLocationParam,
              Anthropic::Models::CitationPageLocationParam,
              Anthropic::Models::CitationContentBlockLocationParam
            )
            ]
          )
        )
          .returns(
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
      def citations=(_)
      end

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
