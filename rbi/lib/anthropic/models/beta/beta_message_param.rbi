# typed: strong

module Anthropic
  module Models
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
            .returns(T.attached_class)
        end
        def self.new(content:, role:)
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

          Variants =
            type_template(:out) do
              {
                fixed: T.any(
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
              }
            end

          BetaContentBlockParamArray =
            T.type_alias do
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
        end

        class Role < Anthropic::Enum
          abstract!

          Value = type_template(:out) { {fixed: Symbol} }

          USER = :user
          ASSISTANT = :assistant
        end
      end
    end

    BetaMessageParam = Beta::BetaMessageParam
  end
end
