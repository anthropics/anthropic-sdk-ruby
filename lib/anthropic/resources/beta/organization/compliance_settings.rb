# frozen_string_literal: true

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
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::ComplianceSettingRetrieveParams} for
          # more details.
          #
          # @overload retrieve(betas: nil, request_options: {})
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional. Send `efs-2026-10-01` in this header to use this endpoint's beta featu
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaComplianceSettings]
          #
          # @see Anthropic::Models::Beta::Organization::ComplianceSettingRetrieveParams
          def retrieve(params = {})
            parsed, options = Anthropic::Beta::Organization::ComplianceSettingRetrieveParams.dump_request(params)
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_COMPLIANCE_SETTINGS_RETRIEVE,
              span_route: "/v1/organizations/compliance_settings",
              method: :get,
              path: "v1/organizations/compliance_settings",
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaComplianceSettings,
              options: options
            )
          end

          # Update your organization's Compliance Settings.
          #
          # Setting `state` to `enabled` turns on the Compliance API and begins capturing
          # organization activity events. Setting it to `disabled` turns both off. Access
          # Transparency events are an exception: they are still captured while the
          # Compliance API is disabled, and the Compliance API activity feed returns them
          # once it is enabled again. `state` reflects whether the Compliance API is
          # enabled.
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
          # {Anthropic::Models::Beta::Organization::ComplianceSettingUpdateParams} for more
          # details.
          #
          # @overload update(state:, betas: nil, request_options: {})
          #
          # @param state [Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateEnabledParam, Anthropic::Models::Beta::Organization::BetaComplianceSettingsStateDisabledParam] Body param: Desired state. Accepts the string shorthand "enabled" or "disabled"
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional. Send `efs-2026-10-01` in this header to use this endpoin
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @raise [Anthropic::Models::SandboxEgressRestrictedError]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaComplianceSettings]
          #
          # @see Anthropic::Models::Beta::Organization::ComplianceSettingUpdateParams
          def update(params)
            parsed, options = Anthropic::Beta::Organization::ComplianceSettingUpdateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              qualifiers: {beta: "true"},
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_COMPLIANCE_SETTINGS_UPDATE,
              span_route: "/v1/organizations/compliance_settings",
              method: :post,
              path: "v1/organizations/compliance_settings",
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaComplianceSettings,
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
end
