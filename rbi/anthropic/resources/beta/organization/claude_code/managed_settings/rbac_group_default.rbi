# typed: strong

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
              sig do
                params(
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupDefaultManagedSettings
                )
              end
              def retrieve(
                # This endpoint is in beta: requests must send
                # `ce-claude-code-managed-settings-2026-10-06` in this header.
                betas: nil,
                request_options: {}
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
              sig do
                params(
                  settings: T.nilable(T::Hash[Symbol, T.anything]),
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions::OrHash
                ).returns(
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupDefaultManagedSettings
                )
              end
              def update(
                # Body param: The whole settings document, a JSON object of Claude Code managed
                # settings. It replaces any stored document, or `null` clears the default
                # settings. At most 1 MiB as the server stores it, which can be larger than the
                # request body.
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
