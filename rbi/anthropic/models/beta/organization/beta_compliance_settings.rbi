# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaComplianceSettings < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaComplianceSettings,
                Anthropic::Internal::AnyHash
              )
            end

          # Whether the Compliance API is enabled for this organization.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaComplianceSettingsState::Variants
            )
          end
          attr_accessor :state

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(
              state:
                T.any(
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabled::OrHash,
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabled::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether the Compliance API is enabled for this organization.
            state:,
            type: :compliance_settings
          )
          end

          sig do
            override.returns(
              {
                state:
                  Anthropic::Beta::Organization::BetaComplianceSettingsState::Variants,
                type: Symbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
