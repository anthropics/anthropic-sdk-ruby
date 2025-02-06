# typed: strong

module Anthropic
  module Models
    BetaContentBlockSource = T.type_alias { Beta::BetaContentBlockSource }

    module Beta
      class BetaContentBlockSource < Anthropic::BaseModel
        sig do
          returns(
            T.any(
              String,
              T::Array[T.any(
                Anthropic::Models::Beta::BetaTextBlockParam,
                Anthropic::Models::Beta::BetaImageBlockParam
              )]
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
              T::Array[T.any(
                Anthropic::Models::Beta::BetaTextBlockParam,
                Anthropic::Models::Beta::BetaImageBlockParam
              )]
            ),
            type: Symbol
          ).void
        end
        def initialize(content:, type: :content)
        end

        sig do
          override.returns(
            {
              content: T.any(
                String,
                T::Array[T.any(
                  Anthropic::Models::Beta::BetaTextBlockParam,
                  Anthropic::Models::Beta::BetaImageBlockParam
                )]
              ),
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class Content < Anthropic::Union
          abstract!

          BetaContentBlockSourceContentArray = T.type_alias do
            T::Array[T.any(
              Anthropic::Models::Beta::BetaTextBlockParam,
              Anthropic::Models::Beta::BetaImageBlockParam
            )]
          end

          sig do
            override.returns(
              [
                [NilClass, String],
                [
                  NilClass,
                  T::Array[T.any(
                    Anthropic::Models::Beta::BetaTextBlockParam,
                    Anthropic::Models::Beta::BetaImageBlockParam
                  )]
                ]
              ]
            )
          end
          private_class_method def self.variants
          end
        end
      end
    end
  end
end
