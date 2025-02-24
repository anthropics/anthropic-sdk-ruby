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
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaTextBlockParam,
                Anthropic::Models::Beta::BetaImageBlockParam,
                Anthropic::Models::Beta::BetaToolUseBlockParam,
                Anthropic::Models::Beta::BetaToolResultBlockParam,
                Anthropic::Models::Beta::BetaBase64PDFBlock,
                Anthropic::Models::Beta::BetaThinkingBlockParam,
                Anthropic::Models::Beta::BetaRedactedThinkingBlockParam
              )
              ]
            )
          )
        end
        def content
        end

        sig do
          params(
            _: T.any(
              String,
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaTextBlockParam,
                Anthropic::Models::Beta::BetaImageBlockParam,
                Anthropic::Models::Beta::BetaToolUseBlockParam,
                Anthropic::Models::Beta::BetaToolResultBlockParam,
                Anthropic::Models::Beta::BetaBase64PDFBlock,
                Anthropic::Models::Beta::BetaThinkingBlockParam,
                Anthropic::Models::Beta::BetaRedactedThinkingBlockParam
              )
              ]
            )
          )
            .returns(
              T.any(
                String,
                T::Array[
                T.any(
                  Anthropic::Models::Beta::BetaTextBlockParam,
                  Anthropic::Models::Beta::BetaImageBlockParam,
                  Anthropic::Models::Beta::BetaToolUseBlockParam,
                  Anthropic::Models::Beta::BetaToolResultBlockParam,
                  Anthropic::Models::Beta::BetaBase64PDFBlock,
                  Anthropic::Models::Beta::BetaThinkingBlockParam,
                  Anthropic::Models::Beta::BetaRedactedThinkingBlockParam
                )
                ]
              )
            )
        end
        def content=(_)
        end

        sig { returns(Symbol) }
        def role
        end

        sig { params(_: Symbol).returns(Symbol) }
        def role=(_)
        end

        sig do
          params(
            content: T.any(
              String,
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaTextBlockParam,
                Anthropic::Models::Beta::BetaImageBlockParam,
                Anthropic::Models::Beta::BetaToolUseBlockParam,
                Anthropic::Models::Beta::BetaToolResultBlockParam,
                Anthropic::Models::Beta::BetaBase64PDFBlock,
                Anthropic::Models::Beta::BetaThinkingBlockParam,
                Anthropic::Models::Beta::BetaRedactedThinkingBlockParam
              )
              ]
            ),
            role: Symbol
          )
            .void
        end
        def initialize(content:, role:)
        end

        sig do
          override
            .returns(
              {
                content: T.any(
                  String,
                  T::Array[
                  T.any(
                    Anthropic::Models::Beta::BetaTextBlockParam,
                    Anthropic::Models::Beta::BetaImageBlockParam,
                    Anthropic::Models::Beta::BetaToolUseBlockParam,
                    Anthropic::Models::Beta::BetaToolResultBlockParam,
                    Anthropic::Models::Beta::BetaBase64PDFBlock,
                    Anthropic::Models::Beta::BetaThinkingBlockParam,
                    Anthropic::Models::Beta::BetaRedactedThinkingBlockParam
                  )
                  ]
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
            T::Array[
            T.any(
              Anthropic::Models::Beta::BetaTextBlockParam,
              Anthropic::Models::Beta::BetaImageBlockParam,
              Anthropic::Models::Beta::BetaToolUseBlockParam,
              Anthropic::Models::Beta::BetaToolResultBlockParam,
              Anthropic::Models::Beta::BetaBase64PDFBlock,
              Anthropic::Models::Beta::BetaThinkingBlockParam,
              Anthropic::Models::Beta::BetaRedactedThinkingBlockParam
            )
            ]
          end

          sig do
            override
              .returns(
                [
                  [NilClass, String],
                  [
                    NilClass,
                    T::Array[
                                    T.any(
                                      Anthropic::Models::Beta::BetaTextBlockParam,
                                      Anthropic::Models::Beta::BetaImageBlockParam,
                                      Anthropic::Models::Beta::BetaToolUseBlockParam,
                                      Anthropic::Models::Beta::BetaToolResultBlockParam,
                                      Anthropic::Models::Beta::BetaBase64PDFBlock,
                                      Anthropic::Models::Beta::BetaThinkingBlockParam,
                                      Anthropic::Models::Beta::BetaRedactedThinkingBlockParam
                                    )
                                    ]
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
