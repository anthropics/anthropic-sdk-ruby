# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaContentBlockSource < Anthropic::Internal::Type::BaseModel
        sig do
          returns(
            T.any(
              String,
              T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
            )
          )
        end
        attr_accessor :content

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            content: T.any(
              String,
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaTextBlockParam,
                Anthropic::Internal::AnyHash,
                Anthropic::Models::Beta::BetaImageBlockParam
              )
              ]
            ),
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(content:, type: :content)
        end

        sig do
          override
            .returns(
              {
                content: T.any(
                  String,
                  T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
                ),
                type: Symbol
              }
            )
        end
        def to_hash
        end

        module Content
          extend Anthropic::Internal::Type::Union

          sig do
            override
              .returns(
                [String, T::Array[T.any(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]]
              )
          end
          def self.variants
          end

          BetaContentBlockSourceContentArray =
            T.let(
              Anthropic::Internal::Type::ArrayOf[union: Anthropic::Models::Beta::BetaContentBlockSourceContent],
              Anthropic::Internal::Type::Converter
            )
        end
      end
    end

    BetaContentBlockSource = Beta::BetaContentBlockSource
  end
end
