# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnthropicHumanReviewParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Whether Anthropic's human review applies to the Workspace's inference data.
          sig do
            params(
              type:
                Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DISABLED =
              T.let(
                :disabled,
                Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam::Type::TaggedSymbol
              )
            ENABLED =
              T.let(
                :enabled,
                Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaAnthropicHumanReviewParam::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
