# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnthropicHumanReview < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnthropicHumanReview,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnthropicHumanReview::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The Workspace's human review setting.
          sig do
            params(
              type:
                Anthropic::Beta::Organization::BetaAnthropicHumanReview::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(type:)
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Organization::BetaAnthropicHumanReview::Type::TaggedSymbol
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
                  Anthropic::Beta::Organization::BetaAnthropicHumanReview::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DISABLED =
              T.let(
                :disabled,
                Anthropic::Beta::Organization::BetaAnthropicHumanReview::Type::TaggedSymbol
              )
            ENABLED =
              T.let(
                :enabled,
                Anthropic::Beta::Organization::BetaAnthropicHumanReview::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaAnthropicHumanReview::Type::TaggedSymbol
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
