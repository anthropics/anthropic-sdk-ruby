# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaComplianceSettingsState
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabled,
                Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabled
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaComplianceSettingsState::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ENABLED =
              T.let(
                :enabled,
                Anthropic::Beta::Organization::BetaComplianceSettingsState::Type::TaggedSymbol
              )
            DISABLED =
              T.let(
                :disabled,
                Anthropic::Beta::Organization::BetaComplianceSettingsState::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaComplianceSettingsState::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaComplianceSettingsState::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Beta::Organization::BetaComplianceSettingsState::Type::OrSymbol
            ).returns(
              Anthropic::Beta::Organization::BetaComplianceSettingsState::Variants
            )
          end
          def self.new(type:)
          end
        end
      end
    end
  end
end
