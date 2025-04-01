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
        attr_accessor :content

        sig { returns(Anthropic::Models::Beta::BetaMessageParam::Role::OrSymbol) }
        attr_accessor :role

        sig do
          params(
            content: T.any(
              String,
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaTextBlockParam,
                Anthropic::Util::AnyHash,
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
          def self.variants
          end

          BetaContentBlockParamArray =
            T.let(
              Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaContentBlockParam],
              Anthropic::Type::Converter
            )
        end

        module Role
          extend Anthropic::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Models::Beta::BetaMessageParam::Role) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Anthropic::Models::Beta::BetaMessageParam::Role::TaggedSymbol) }

          USER = T.let(:user, Anthropic::Models::Beta::BetaMessageParam::Role::TaggedSymbol)
          ASSISTANT = T.let(:assistant, Anthropic::Models::Beta::BetaMessageParam::Role::TaggedSymbol)

          sig { override.returns(T::Array[Anthropic::Models::Beta::BetaMessageParam::Role::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end

    BetaMessageParam = Beta::BetaMessageParam
  end
end
