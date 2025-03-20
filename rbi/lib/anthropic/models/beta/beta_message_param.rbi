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

        sig { returns(Anthropic::Models::Beta::BetaMessageParam::Role::OrSymbol) }
        def role
        end

        sig do
          params(_: Anthropic::Models::Beta::BetaMessageParam::Role::OrSymbol)
            .returns(Anthropic::Models::Beta::BetaMessageParam::Role::OrSymbol)
        end
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
            role: Anthropic::Models::Beta::BetaMessageParam::Role::OrSymbol
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
                role: Anthropic::Models::Beta::BetaMessageParam::Role::OrSymbol
              }
            )
        end
        def to_hash
        end

        module Content
          extend Anthropic::Union

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
            T.let(Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaContentBlockParam], Anthropic::Converter)

          class << self
            sig do
              override
                .returns(
                  [
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
                  ]
                )
            end
            def variants
            end
          end
        end

        module Role
          extend Anthropic::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Models::Beta::BetaMessageParam::Role) }
          OrSymbol = T.type_alias { T.any(Symbol, Anthropic::Models::Beta::BetaMessageParam::Role::TaggedSymbol) }

          USER = T.let(:user, Anthropic::Models::Beta::BetaMessageParam::Role::TaggedSymbol)
          ASSISTANT = T.let(:assistant, Anthropic::Models::Beta::BetaMessageParam::Role::TaggedSymbol)

          class << self
            sig { override.returns(T::Array[Anthropic::Models::Beta::BetaMessageParam::Role::TaggedSymbol]) }
            def values
            end
          end
        end
      end
    end

    BetaMessageParam = Beta::BetaMessageParam
  end
end
