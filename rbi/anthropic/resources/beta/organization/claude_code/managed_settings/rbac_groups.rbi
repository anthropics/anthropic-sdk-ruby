# typed: strong

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
              sig do
                params(
                  rbac_group_id: String,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettings
                )
              end
              def retrieve(
                # The RBAC Group's ID, prefixed `rbac_group_`.
                rbac_group_id,
                # This endpoint is in beta: requests must send
                # `ce-claude-code-managed-settings-2026-10-06` in this header.
                betas: nil,
                request_options: {}
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
              sig do
                params(
                  limit: Integer,
                  page: T.nilable(String),
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Internal::PageCursor[
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettingsSummary
                  ]
                )
              end
              def list(
                # Query param: Number of items to return per page.
                #
                # Defaults to `20`. Ranges from `1` to `100`.
                limit: nil,
                # Query param: Optionally set to the `next_page` token from the previous response.
                page: nil,
                # Header param: This endpoint is in beta: requests must send
                # `ce-claude-code-managed-settings-2026-10-06` in this header.
                betas: nil,
                request_options: {}
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
              sig do
                params(
                  rbac_group_id: String,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaDeletedClaudeCodeRBACGroupManagedSettings
                )
              end
              def delete(
                # The RBAC Group's ID, prefixed `rbac_group_`.
                rbac_group_id,
                # This endpoint is in beta: requests must send
                # `ce-claude-code-managed-settings-2026-10-06` in this header.
                betas: nil,
                request_options: {}
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
              sig do
                params(
                  rbac_group_id: String,
                  settings: T::Hash[Symbol, T.anything],
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettings
                )
              end
              def set(
                # Path param: The RBAC Group's ID, prefixed `rbac_group_`.
                rbac_group_id,
                # Body param: The whole settings document, a JSON object of Claude Code managed
                # settings. It replaces any stored document. At most 1 MiB as the server stores
                # it, which can be larger than the request body.
                settings:,
                # Header param: This endpoint is in beta: requests must send
                # `ce-claude-code-managed-settings-2026-10-06` in this header.
                betas: nil,
                request_options: {}
              )
              end

              # @api private
              sig do
                params(client: Anthropic::Client).returns(T.attached_class)
              end
              def self.new(client:)
              end
            end
          end
        end
      end
    end
  end
end
