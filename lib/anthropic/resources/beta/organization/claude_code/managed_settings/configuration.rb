# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeCode
          class ManagedSettings
            class Configuration
              # Retrieve the organization's Claude Code managed settings mode and RBAC Group
              # order.
              #
              # **Accepted credentials:** an organization-level Admin API key with the
              # `read:claude_code_managed_settings` scope.
              #
              # Every request must include the beta header
              # `anthropic-beta: ce-claude-code-managed-settings-2026-10-06`. A request without
              # it, or from an organization not enabled for this beta, returns `404`. The Claude
              # Code Managed Settings API is in beta and is available to Claude Enterprise
              # organizations only.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::ConfigurationRetrieveParams}
              # for more details.
              #
              # @overload retrieve(betas: nil, request_options: {})
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @return [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsConfiguration]
              #
              # @see Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::ConfigurationRetrieveParams
              def retrieve(params = {})
                parsed, options =
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::ConfigurationRetrieveParams.dump_request(
                    params
                  )
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_CODE_MANAGED_SETTINGS_CONFIGURATION_RETRIEVE,
                  span_route: "/v1/organizations/claude_code/managed_settings/configuration",
                  method: :get,
                  path: "v1/organizations/claude_code/managed_settings/configuration",
                  headers: parsed.transform_keys(betas: "anthropic-beta"),
                  model: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsConfiguration,
                  options: {
                    extra_headers: {"anthropic-beta" => "ce-claude-code-managed-settings-2026-10-06"}, **options
                  }
                )
              end

              # Change the organization's Claude Code managed settings mode, the RBAC Group
              # order, or both, in one atomic write.
              #
              # To change the order, send `rbac_group_order` with the `rbac_group_order_version`
              # from the read the change is based on. If the order has changed since that read,
              # the request returns `409`: read it again and retry. To switch modes only if the
              # order has not changed, send the current `rbac_group_order` and
              # `rbac_group_order_version` with the new `mode`.
              #
              # A switch to `rbac_groups` mode with no RBAC Group settings and no default
              # settings copies the organization settings into a new default, in the same write,
              # so members keep the settings they had. The copy does not follow later changes to
              # the organization settings. If the organization settings cannot be copied, the
              # request returns `400` and changes nothing. If they cannot be read, are over 1
              # MiB or are not valid, setting the default settings first avoids the copy.
              #
              # After a switch to `rbac_groups` mode, a member in no listed RBAC Group receives
              # the default settings, or no settings if no default is set, not the organization
              # settings.
              #
              # **Accepted credentials:** an organization-level Admin API key with the
              # `write:claude_code_managed_settings` scope.
              #
              # Every request must include the beta header
              # `anthropic-beta: ce-claude-code-managed-settings-2026-10-06`. A request without
              # it, or from an organization not enabled for this beta, returns `404`. The Claude
              # Code Managed Settings API is in beta and is available to Claude Enterprise
              # organizations only.
              #
              # A write that returns `503` may have applied. Retrying it is safe.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::ConfigurationUpdateParams}
              # for more details.
              #
              # @overload update(mode: nil, rbac_group_order: nil, rbac_group_order_version: nil, betas: nil, request_options: {})
              #
              # @param mode [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationModeParam, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsModeParam] Body param: The new mode, as an object such as `{"type": "rbac_groups"}`.
              #
              # @param rbac_group_order [Array<String>] Body param: Every RBAC Group that has settings, each listed once, in the new ord
              #
              # @param rbac_group_order_version [String] Body param: The `rbac_group_order_version` from the read this change is based on
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @raise [Anthropic::Models::CMEKKeyDisabledError]
              # @raise [Anthropic::Models::BetaRequestBodyTimeoutError]
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaSettingsDocumentLimitExceededError]
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaSettingsHistoryLimitExceededError]
              # @raise [Anthropic::Models::SandboxEgressRestrictedError]
              #
              # @return [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsConfiguration]
              #
              # @see Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::ConfigurationUpdateParams
              def update(params = {})
                parsed, options =
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::ConfigurationUpdateParams.dump_request(params)
                header_params = {betas: "anthropic-beta"}
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_CODE_MANAGED_SETTINGS_CONFIGURATION_UPDATE,
                  span_route: "/v1/organizations/claude_code/managed_settings/configuration",
                  method: :post,
                  path: "v1/organizations/claude_code/managed_settings/configuration",
                  headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                  body: parsed.except(*header_params.keys),
                  model: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsConfiguration,
                  options: {
                    extra_headers: {"anthropic-beta" => "ce-claude-code-managed-settings-2026-10-06"}, **options
                  }
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
  end
end
