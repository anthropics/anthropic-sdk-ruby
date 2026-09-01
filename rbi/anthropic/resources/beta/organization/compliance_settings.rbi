# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class ComplianceSettings
          # Retrieve your organization's Compliance Settings.
          #
          # Compliance Settings is a singleton resource: there is exactly one per
          # organization, addressed without an identifier. The `state` field reflects
          # whether the Compliance API is enabled. An organization with a parent
          # organization reads the state inherited from the parent's configuration.
          sig do
            params(request_options: Anthropic::RequestOptions::OrHash).returns(
              Anthropic::Beta::Organization::BetaComplianceSettings
            )
          end
          def retrieve(request_options: {})
          end

          # Update your organization's Compliance Settings.
          #
          # Setting `state` to `enabled` turns on the Compliance API and begins capturing
          # organization activity events. Setting it to `disabled` turns both off. `state`
          # reflects whether the Compliance API is enabled.
          #
          # A request that sets `state` to its current value succeeds and leaves the
          # resource unchanged. A `disabled` request stays in effect until a later `enabled`
          # request or the organization's next provisioning action that enables Access
          # Transparency: enabling Access Transparency also enables the Compliance API,
          # which serves its activity events, so such provisioning (including re-runs)
          # re-enables the Compliance API even after a `disabled` request. Automated
          # provisioning never disables compliance settings.
          sig do
            params(
              state:
                T.any(
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabledParam::OrHash,
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabledParam::OrHash
                ),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaComplianceSettings)
          end
          def update(
            # Desired state. Accepts the string shorthand "enabled" or "disabled" in place of
            # the object form; the response always returns the canonical object form.
            state:,
            request_options: {}
          )
          end

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
