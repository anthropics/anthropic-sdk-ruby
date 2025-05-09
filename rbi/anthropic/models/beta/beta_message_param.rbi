# typed: strong

module Anthropic
  module Models
    BetaMessageParam = Beta::BetaMessageParam

    module Beta
      class BetaMessageParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Anthropic::Internal::AnyHash) }

        sig do
          returns(
            T.any(
              String,
              T::Array[
                T.any(
                  Anthropic::Beta::BetaTextBlockParam,
                  Anthropic::Beta::BetaImageBlockParam,
                  Anthropic::Beta::BetaToolUseBlockParam,
                  Anthropic::Beta::BetaServerToolUseBlockParam,
                  Anthropic::Beta::BetaWebSearchToolResultBlockParam,
                  Anthropic::Beta::BetaToolResultBlockParam,
                  Anthropic::Beta::BetaBase64PDFBlock,
                  Anthropic::Beta::BetaThinkingBlockParam,
                  Anthropic::Beta::BetaRedactedThinkingBlockParam
                )
              ]
            )
          )
        end
        attr_accessor :content

        sig { returns(Anthropic::Beta::BetaMessageParam::Role::OrSymbol) }
        attr_accessor :role

        sig do
          params(
            content:
              T.any(
                String,
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaTextBlockParam::OrHash,
                    Anthropic::Beta::BetaImageBlockParam::OrHash,
                    Anthropic::Beta::BetaToolUseBlockParam::OrHash,
                    Anthropic::Beta::BetaServerToolUseBlockParam::OrHash,
                    Anthropic::Beta::BetaWebSearchToolResultBlockParam::OrHash,
                    Anthropic::Beta::BetaToolResultBlockParam::OrHash,
                    Anthropic::Beta::BetaBase64PDFBlock::OrHash,
                    Anthropic::Beta::BetaThinkingBlockParam::OrHash,
                    Anthropic::Beta::BetaRedactedThinkingBlockParam::OrHash
                  )
                ]
              ),
            role: Anthropic::Beta::BetaMessageParam::Role::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(content:, role:)
        end

        sig do
          override.returns(
            {
              content:
                T.any(
                  String,
                  T::Array[
                    T.any(
                      Anthropic::Beta::BetaTextBlockParam,
                      Anthropic::Beta::BetaImageBlockParam,
                      Anthropic::Beta::BetaToolUseBlockParam,
                      Anthropic::Beta::BetaServerToolUseBlockParam,
                      Anthropic::Beta::BetaWebSearchToolResultBlockParam,
                      Anthropic::Beta::BetaToolResultBlockParam,
                      Anthropic::Beta::BetaBase64PDFBlock,
                      Anthropic::Beta::BetaThinkingBlockParam,
                      Anthropic::Beta::BetaRedactedThinkingBlockParam
                    )
                  ]
                ),
              role: Anthropic::Beta::BetaMessageParam::Role::OrSymbol
            }
          )
        end
        def to_hash
        end

        module Content
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaTextBlockParam,
                    Anthropic::Beta::BetaImageBlockParam,
                    Anthropic::Beta::BetaToolUseBlockParam,
                    Anthropic::Beta::BetaServerToolUseBlockParam,
                    Anthropic::Beta::BetaWebSearchToolResultBlockParam,
                    Anthropic::Beta::BetaToolResultBlockParam,
                    Anthropic::Beta::BetaBase64PDFBlock,
                    Anthropic::Beta::BetaThinkingBlockParam,
                    Anthropic::Beta::BetaRedactedThinkingBlockParam
                  )
                ]
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaMessageParam::Content::Variants]
            )
          end
          def self.variants
          end

          BetaContentBlockParamArray =
            T.let(
              Anthropic::Internal::Type::ArrayOf[
                union: Anthropic::Beta::BetaContentBlockParam
              ],
              Anthropic::Internal::Type::Converter
            )
        end

        module Role
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaMessageParam::Role)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          USER =
            T.let(:user, Anthropic::Beta::BetaMessageParam::Role::TaggedSymbol)
          ASSISTANT =
            T.let(
              :assistant,
              Anthropic::Beta::BetaMessageParam::Role::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaMessageParam::Role::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
