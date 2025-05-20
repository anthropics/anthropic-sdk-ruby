# typed: strong

module Anthropic
  module Models
    BetaMessageParam = Beta::BetaMessageParam

    module Beta
      class BetaMessageParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMessageParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Anthropic::Beta::BetaMessageParam::Content::Variants) }
        attr_accessor :content

        sig { returns(Anthropic::Beta::BetaMessageParam::Role::OrSymbol) }
        attr_accessor :role

        sig do
          params(
            content: Anthropic::Beta::BetaMessageParam::Content::Variants,
            role: Anthropic::Beta::BetaMessageParam::Role::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(content:, role:)
        end

        sig do
          override.returns(
            {
              content: Anthropic::Beta::BetaMessageParam::Content::Variants,
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
                T::Array[Anthropic::Beta::BetaContentBlockParam::Variants]
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
