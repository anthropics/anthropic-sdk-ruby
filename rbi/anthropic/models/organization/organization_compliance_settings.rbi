# typed: strong

module Anthropic
  module Models
    OrganizationComplianceSettings =
      Organization::OrganizationComplianceSettings

    module Organization
      class OrganizationComplianceSettings < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::OrganizationComplianceSettings,
              Anthropic::Internal::AnyHash
            )
          end

        # Whether the Compliance API is enabled for this organization.
        sig do
          returns(Anthropic::Organization::ComplianceSettingsState::Variants)
        end
        attr_accessor :state

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            state:
              T.any(
                Anthropic::Organization::ComplianceSettingsStateEnabled::OrHash,
                Anthropic::Organization::ComplianceSettingsStateDisabled::OrHash
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
              state: Anthropic::Organization::ComplianceSettingsState::Variants,
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
