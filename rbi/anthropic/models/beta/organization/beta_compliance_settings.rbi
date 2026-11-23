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

          # Read-only. Whether Access Transparency is on for the organization. Returned only
          # when the request sends the `anthropic-beta: efs-2026-10-01` header and Access
          # Transparency is available to the organization; otherwise omitted. If the status
          # can't be read, getting Compliance Settings returns an error; an update still
          # saves, but then reports `disabled` whatever the real status, so get the settings
          # again to check it.
          sig do
            returns(
              T.nilable(Anthropic::Beta::Organization::BetaAccessTransparency)
            )
          end
          attr_reader :access_transparency

          sig do
            params(
              access_transparency:
                Anthropic::Beta::Organization::BetaAccessTransparency::OrHash
            ).void
          end
          attr_writer :access_transparency

          sig do
            params(
              state:
                T.any(
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabled::OrHash,
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabled::OrHash
                ),
              access_transparency:
                Anthropic::Beta::Organization::BetaAccessTransparency::OrHash,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether the Compliance API is enabled for this organization.
            state:,
            # Read-only. Whether Access Transparency is on for the organization. Returned only
            # when the request sends the `anthropic-beta: efs-2026-10-01` header and Access
            # Transparency is available to the organization; otherwise omitted. If the status
            # can't be read, getting Compliance Settings returns an error; an update still
            # saves, but then reports `disabled` whatever the real status, so get the settings
            # again to check it.
            access_transparency: nil,
            type: :compliance_settings
          )
          end

          sig do
            override.returns(
              {
                state:
                  Anthropic::Beta::Organization::BetaComplianceSettingsState::Variants,
                type: Symbol,
                access_transparency:
                  Anthropic::Beta::Organization::BetaAccessTransparency
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
