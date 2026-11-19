# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeCode
          class ManagedSettings
            class RBACGroups
              # Retrieve an RBAC Group's Claude Code managed settings.
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
              # {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupRetrieveParams}
              # for more details.
              #
              # @overload retrieve(rbac_group_id, betas: nil, request_options: {})
              #
              # @param rbac_group_id [String] The RBAC Group's ID, prefixed `rbac_group_`.
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaCMEKFeatureUnsupportedError]
              # @raise [Anthropic::Models::CMEKKeyDisabledError]
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaRBACGroupManagedSettingsNotFoundError]
              #
              # @return [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettings]
              #
              # @see Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupRetrieveParams
              def retrieve(rbac_group_id, params = {})
                parsed, options =
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupRetrieveParams.dump_request(params)
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_CODE_MANAGED_SETTINGS_RBAC_GROUPS_RETRIEVE,
                  span_attributes: {"anthropic.organization.claude_code.managed_setting.rbac_group.id" => rbac_group_id},
                  span_route: "/v1/organizations/claude_code/managed_settings/rbac_groups/{rbac_group_id}",
                  method: :get,
                  path: ["v1/organizations/claude_code/managed_settings/rbac_groups/%1$s", rbac_group_id],
                  headers: parsed.transform_keys(betas: "anthropic-beta"),
                  model: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettings,
                  options: {
                    extra_headers: {"anthropic-beta" => "ce-claude-code-managed-settings-2026-10-06"}, **options
                  }
                )
              end

              # List the RBAC Groups that have Claude Code managed settings, highest precedence
              # first.
              #
              # Each entry gives the group's status and timestamps, not its settings. The list
              # includes deleted groups that still have settings, and leaves out the default
              # settings. If the order changes between pages, the request returns `409`: list
              # again from the first page.
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
              # {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupListParams}
              # for more details.
              #
              # @overload list(limit: nil, page: nil, betas: nil, request_options: {})
              #
              # @param limit [Integer] Query param: Number of items to return per page.
              #
              # @param page [String, nil] Query param: Optionally set to the `next_page` token from the previous response.
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettingsSummary>]
              #
              # @see Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupListParams
              def list(params = {})
                query_params = [:limit, :page]
                parsed, options =
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupListParams.dump_request(params)
                query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_CODE_MANAGED_SETTINGS_RBAC_GROUPS_LIST,
                  span_route: "/v1/organizations/claude_code/managed_settings/rbac_groups",
                  span_query: %w[limit page],
                  method: :get,
                  path: "v1/organizations/claude_code/managed_settings/rbac_groups",
                  query: query,
                  headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                  page: Anthropic::Internal::PageCursor,
                  model: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettingsSummary,
                  options: {
                    extra_headers: {"anthropic-beta" => "ce-claude-code-managed-settings-2026-10-06"}, **options
                  }
                )
              end

              # Delete an RBAC Group's Claude Code managed settings and remove the group from
              # `rbac_group_order`.
              #
              # A group with no settings returns `404` with the error code
              # `rbac_group_managed_settings_not_found`. That code on a retry of a delete that
              # returned `503` means the settings are gone.
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
              # {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDeleteParams}
              # for more details.
              #
              # @overload delete(rbac_group_id, betas: nil, request_options: {})
              #
              # @param rbac_group_id [String] The RBAC Group's ID, prefixed `rbac_group_`.
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @raise [Anthropic::Models::CMEKKeyDisabledError]
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaSettingsHistoryLimitExceededError]
              # @raise [Anthropic::Models::SandboxEgressRestrictedError]
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaRBACGroupManagedSettingsNotFoundError]
              #
              # @return [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaDeletedClaudeCodeRBACGroupManagedSettings]
              #
              # @see Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDeleteParams
              def delete(rbac_group_id, params = {})
                parsed, options =
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDeleteParams.dump_request(params)
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_CODE_MANAGED_SETTINGS_RBAC_GROUPS_DELETE,
                  span_attributes: {"anthropic.organization.claude_code.managed_setting.rbac_group.id" => rbac_group_id},
                  span_route: "/v1/organizations/claude_code/managed_settings/rbac_groups/{rbac_group_id}",
                  method: :delete,
                  path: ["v1/organizations/claude_code/managed_settings/rbac_groups/%1$s", rbac_group_id],
                  headers: parsed.transform_keys(betas: "anthropic-beta"),
                  model: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaDeletedClaudeCodeRBACGroupManagedSettings,
                  options: {
                    extra_headers: {"anthropic-beta" => "ce-claude-code-managed-settings-2026-10-06"}, **options
                  }
                )
              end

              # Create or replace an RBAC Group's Claude Code managed settings.
              #
              # New settings join the end of `rbac_group_order`, and existing settings keep
              # their place. Until the group is moved up, its members who also belong to an
              # earlier group keep that group's settings. In `organization` mode a write changes
              # no member's settings until the organization switches to `rbac_groups` mode. Once
              # a group has settings, that switch no longer copies the organization settings
              # into default settings, so members in no RBAC Group in `rbac_group_order` receive
              # no settings unless you set the default settings before the switch.
              #
              # Get the group's ID from the RBAC Groups API. One key can hold `read:rbac_groups`
              # and `write:claude_code_managed_settings`.
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
              # {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupSetParams}
              # for more details.
              #
              # @overload set(rbac_group_id, settings:, betas: nil, request_options: {})
              #
              # @param rbac_group_id [String] Path param: The RBAC Group's ID, prefixed `rbac_group_`.
              #
              # @param settings [Hash{Symbol=>Object}] Body param: The whole settings document, a JSON object of Claude Code managed se
              #
              # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send
              #
              # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
              #
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaCMEKFeatureUnsupportedError]
              # @raise [Anthropic::Models::CMEKKeyDisabledError]
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaRBACGroupOrderLimitExceededError]
              # @raise [Anthropic::Models::BetaRequestBodyTimeoutError]
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaSettingsDocumentLimitExceededError]
              # @raise [Anthropic::Models::Beta::Organization::ClaudeCode::BetaSettingsHistoryLimitExceededError]
              # @raise [Anthropic::Models::SandboxEgressRestrictedError]
              # @raise [Anthropic::Models::Beta::Organization::BetaRBACGroupNotFoundError]
              #
              # @return [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettings]
              #
              # @see Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupSetParams
              def set(rbac_group_id, params)
                parsed, options =
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupSetParams.dump_request(params)
                header_params = {betas: "anthropic-beta"}
                @client.request(
                  qualifiers: {beta: "true"},
                  span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_CLAUDE_CODE_MANAGED_SETTINGS_RBAC_GROUPS_SET,
                  span_attributes: {"anthropic.organization.claude_code.managed_setting.rbac_group.id" => rbac_group_id},
                  span_route: "/v1/organizations/claude_code/managed_settings/rbac_groups/{rbac_group_id}",
                  method: :post,
                  path: ["v1/organizations/claude_code/managed_settings/rbac_groups/%1$s", rbac_group_id],
                  headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                  body: parsed.except(*header_params.keys),
                  model: Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettings,
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
