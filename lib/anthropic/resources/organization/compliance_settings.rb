# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      class ComplianceSettings
        # Retrieve your organization's Compliance Settings.
        #
        # Compliance Settings is a singleton resource: there is exactly one per
        # organization, addressed without an identifier. The `state` field reflects
        # whether the Compliance API is enabled. An organization with a parent
        # organization reads the state inherited from the parent's configuration.
        #
        # @overload retrieve(request_options: {})
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::OrganizationComplianceSettings]
        #
        # @see Anthropic::Models::Organization::ComplianceSettingRetrieveParams
        def retrieve(params = {})
          @client.request(
            method: :get,
            path: "v1/organizations/compliance_settings",
            model: Anthropic::Organization::OrganizationComplianceSettings,
            options: params[:request_options]
          )
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
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Organization::ComplianceSettingUpdateParams} for more
        # details.
        #
        # @overload update(state:, request_options: {})
        #
        # @param state [Anthropic::Models::Organization::ComplianceSettingsStateEnabledParam, Anthropic::Models::Organization::ComplianceSettingsStateDisabledParam] Desired state. Accepts the string shorthand "enabled" or "disabled" in place of
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::OrganizationComplianceSettings]
        #
        # @see Anthropic::Models::Organization::ComplianceSettingUpdateParams
        def update(params)
          parsed, options = Anthropic::Organization::ComplianceSettingUpdateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/organizations/compliance_settings",
            body: parsed,
            model: Anthropic::Organization::OrganizationComplianceSettings,
            options: options
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
