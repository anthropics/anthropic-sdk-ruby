# typed: strong

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
              sig do
                params(
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsConfiguration
                )
              end
              def retrieve(
                # This endpoint is in beta: requests must send
                # `ce-claude-code-managed-settings-2026-10-06` in this header.
                betas: nil,
                request_options: {}
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
              sig do
                params(
                  mode:
                    T.any(
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsOrganizationModeParam::OrHash,
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsRBACGroupsModeParam::OrHash
                    ),
                  rbac_group_order: T::Array[String],
                  rbac_group_order_version: String,
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeManagedSettingsConfiguration
                )
              end
              def update(
                # Body param: The new mode, as an object such as `{"type": "rbac_groups"}`.
                mode: nil,
                # Body param: Every RBAC Group that has settings, each listed once, in the new
                # order, highest precedence first. Requires `rbac_group_order_version`.
                rbac_group_order: nil,
                # Body param: The `rbac_group_order_version` from the read this change is based
                # on. Requires `rbac_group_order`.
                rbac_group_order_version: nil,
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
