# typed: strong

module Anthropic
  module Models
    class TextBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash = T.type_alias { T.any(T.self_type, Anthropic::Internal::AnyHash) }

      sig { returns(String) }
      attr_accessor :text

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      sig do
        returns(
          T.nilable(
            T::Array[
              T.any(
                Anthropic::CitationCharLocationParam,
                Anthropic::CitationPageLocationParam,
                Anthropic::CitationContentBlockLocationParam
              )
            ]
          )
        )
      end
      attr_accessor :citations

      sig do
        params(
          text: String,
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          citations:
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::CitationCharLocationParam::OrHash,
                  Anthropic::CitationPageLocationParam::OrHash,
                  Anthropic::CitationContentBlockLocationParam::OrHash
                )
              ]
            ),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(text:, cache_control: nil, citations: nil, type: :text)
      end

      sig do
        override.returns(
          {
            text: String,
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            citations:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::CitationCharLocationParam,
                    Anthropic::CitationPageLocationParam,
                    Anthropic::CitationContentBlockLocationParam
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
