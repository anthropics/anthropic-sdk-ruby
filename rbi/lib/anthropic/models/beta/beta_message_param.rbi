# typed: strong

module Anthropic
  module Models
    BetaMessageParam = T.type_alias { Beta::BetaMessageParam }

    module Beta
      class BetaMessageParam < Anthropic::BaseModel
        sig do
          returns(
            T.any(
              String,
              T::Array[T.any(
                Anthropic::Models::Beta::BetaTextBlockParam,
                Anthropic::Models::Beta::BetaImageBlockParam,
                Anthropic::Models::Beta::BetaToolUseBlockParam,
                Anthropic::Models::Beta::BetaToolResultBlockParam,
                Anthropic::Models::Beta::BetaBase64PDFBlock
              )]
            )
          )
        end
        attr_accessor :content

        sig { returns(Symbol) }
        attr_accessor :role

        sig do
          params(
            content: T.any(
              String,
              T::Array[T.any(
                Anthropic::Models::Beta::BetaTextBlockParam,
                Anthropic::Models::Beta::BetaImageBlockParam,
                Anthropic::Models::Beta::BetaToolUseBlockParam,
                Anthropic::Models::Beta::BetaToolResultBlockParam,
                Anthropic::Models::Beta::BetaBase64PDFBlock
              )]
            ),
            role: Symbol
          ).void
        end
        def initialize(content:, role:)
        end

        sig do
          override.returns(
            {
              content: T.any(
                String,
                T::Array[T.any(
                  Anthropic::Models::Beta::BetaTextBlockParam,
                  Anthropic::Models::Beta::BetaImageBlockParam,
                  Anthropic::Models::Beta::BetaToolUseBlockParam,
                  Anthropic::Models::Beta::BetaToolResultBlockParam,
                  Anthropic::Models::Beta::BetaBase64PDFBlock
                )]
              ),
              role: Symbol
            }
          )
        end
        def to_hash
        end

        class Content < Anthropic::Union
          abstract!

          BetaContentBlockParamArray = T.type_alias do
            T::Array[T.any(
              Anthropic::Models::Beta::BetaTextBlockParam,
              Anthropic::Models::Beta::BetaImageBlockParam,
              Anthropic::Models::Beta::BetaToolUseBlockParam,
              Anthropic::Models::Beta::BetaToolResultBlockParam,
              Anthropic::Models::Beta::BetaBase64PDFBlock
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
                    Anthropic::Models::Beta::BetaImageBlockParam,
                    Anthropic::Models::Beta::BetaToolUseBlockParam,
                    Anthropic::Models::Beta::BetaToolResultBlockParam,
                    Anthropic::Models::Beta::BetaBase64PDFBlock
                  )]
                ]
              ]
            )
          end
          private_class_method def self.variants
          end
        end

        class Role < Anthropic::Enum
          abstract!

          USER = :user
          ASSISTANT = :assistant

          sig { override.returns(T::Array[Symbol]) }
          def self.values
          end
        end
      end
    end
  end
end
