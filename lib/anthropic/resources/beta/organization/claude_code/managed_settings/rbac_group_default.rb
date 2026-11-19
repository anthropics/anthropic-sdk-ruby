# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeCode
          class ManagedSettings
            class RBACGroupDefault
              # Retrieve the default Claude Code managed settings, which members who belong to
              # no RBAC Group in `rbac_group_order` receive in `rbac_groups` mode.
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
              # {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefaultRetrieveParams}
              # for more details.
              #
              # @overload retrieve(betas: nil, request_options: {})
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaCMEKFeatureUnsupportedError]
              # @raise [Anthropic::Models::CMEKKeyDisabledError]
              #
              # @return [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupDefaultManagedSettings]
              #
              # @see Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefaultRetrieveParams
              def retrieve(params = {})
                parsed, options =
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefaultRetrieveParams.dump_request(
                    params
                  )
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_CODE_MANAGED_SETTINGS_RBAC_GROUP_DEFAULT_RETRIEVE,
                  span_route: "/v1/organizations/claude_code/managed_settings/rbac_group_default",
                  method: :get,
                  path: "v1/organizations/claude_code/managed_settings/rbac_group_default",
                  headers: parsed.transform_keys(betas: "anthropic-beta"),
                  model: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupDefaultManagedSettings,
                  options: {
                    extra_headers: {"anthropic-beta" => "ce-claude-code-managed-settings-2026-10-06"}, **options
                  }
                )
              end

              # Set or replace the default Claude Code managed settings, or clear them with
              # `null`.
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
              # {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefaultUpdateParams}
              # for more details.
              #
              # @overload update(settings:, betas: nil, request_options: {})
              #
              # @param settings [Hash{Symbol=>Object}, nil] Body param: The whole settings document, a JSON object of Claude Code managed se
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaCMEKFeatureUnsupportedError]
              # @raise [Anthropic::Models::CMEKKeyDisabledError]
              # @raise [Anthropic::Models::BetaRequestBodyTimeoutError]
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaSettingsDocumentLimitExceededError]
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaSettingsHistoryLimitExceededError]
              # @raise [Anthropic::Models::SandboxEgressRestrictedError]
              #
              # @return [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupDefaultManagedSettings]
              #
              # @see Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefaultUpdateParams
              def update(params)
                parsed, options =
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefaultUpdateParams.dump_request(
                    params
                  )
                header_params = {betas: "anthropic-beta"}
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_CODE_MANAGED_SETTINGS_RBAC_GROUP_DEFAULT_UPDATE,
                  span_route: "/v1/organizations/claude_code/managed_settings/rbac_group_default",
                  method: :post,
                  path: "v1/organizations/claude_code/managed_settings/rbac_group_default",
                  headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                  body: parsed.except(*header_params.keys),
                  model: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupDefaultManagedSettings,
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
