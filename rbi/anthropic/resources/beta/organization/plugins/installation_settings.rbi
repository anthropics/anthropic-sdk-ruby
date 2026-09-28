# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Plugins
          class InstallationSettings
            # List an organization-owned Plugin's installation settings, which say which
            # members it is for, most recently created first.
            #
            # The list holds the Plugin's own organization-wide setting (absent while the
            # Plugin inherits its marketplace's default) and each RBAC Group's own setting. A
            # member-owned Plugin has shares instead, so this path returns 404 for one.
            #
            # **Accepted credentials:** an Admin API key with the `read:plugins` or
            # `read:org_audit` scope, or a Compliance Access Key with the
            # `read:compliance_org_data` scope.
            #
            # Every request must include the beta header
            # `anthropic-beta: ce-plugins-2026-09-01`. A request without it returns `404`,
            # exactly as if the endpoint did not exist. The Plugins API is in beta and is
            # available to Claude Enterprise organizations only. It is not available to Claude
            # Platform (Claude Console) organizations, or to organizations with HIPAA
            # readiness enabled.
            sig do
              params(
                plugin_id: String,
                limit: Integer,
                organization_id: T.nilable(String),
                page: T.nilable(String),
                target_type:
                  T.nilable(
                    Anthropic::Beta::Organization::Plugins::InstallationSettingListParams::TargetType::OrSymbol
                  ),
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting
                ]
              )
            end
            def list(
              # Path param: ID of the Plugin (prefixed `plugin_`).
              plugin_id,
              # Query param: Number of items to return per page.
              #
              # Defaults to `20`. Ranges from `1` to `100`.
              limit: nil,
              # Query param: For a `read:org_audit` or `read:compliance_org_data` key created
              # for all of a parent organization's linked organizations: a child organization of
              # that parent to read instead of the organization the key was created in, given as
              # the organization's UUID or its `org_`-prefixed ID. A value that is neither
              # returns a 400; an organization that is not a child of the key's parent, or where
              # the Plugins API is not available, returns a 404. Any other key may pass only its
              # own organization's ID here; another organization returns a 404.
              organization_id: nil,
              # Query param: Optionally set to the `next_page` token from the previous response.
              page: nil,
              # Query param: Only settings for this kind of target: `organization` (the
              # organization-wide setting) or `rbac_group` (an RBAC Group's).
              target_type: nil,
              # Header param: This endpoint is in beta: requests must send
              # `ce-plugins-2026-09-01` in this header.
              betas: nil,
              request_options: {}
            )
            end

            # Remove one RBAC Group's own installation setting for an organization-owned
            # Plugin, so that the group's members fall back to the Plugin's organization-wide
            # setting or to the settings of their other groups.
            #
            # A group that holds no setting returns 404, and so does a member-owned Plugin.
            #
            # A removal counts as one of the Plugin's installation-setting writes: send all of
            # those writes one at a time. If several arrive for the same Plugin at the same
            # time, the server handles them one after another and can answer some of them with
            # `503` and `x-should-retry: true` instead of applying them; wait a second or two
            # and send the removal again. A `404` on the repeat means the setting is already
            # gone.
            #
            # **Accepted credentials:** an Admin API key with the `write:plugins` scope.
            #
            # Every request must include the beta header
            # `anthropic-beta: ce-plugins-2026-09-01`. A request without it returns `404`,
            # exactly as if the endpoint did not exist. The Plugins API is in beta and is
            # available to Claude Enterprise organizations only. It is not available to Claude
            # Platform (Claude Console) organizations, or to organizations with HIPAA
            # readiness enabled.
            sig do
              params(
                target: String,
                plugin_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting
              )
            end
            def remove(
              # Path param: The RBAC Group (ID prefixed `rbac_group_`) whose own setting is
              # removed. The literal `organization` is refused with a 400: an organization-wide
              # setting cannot be removed.
              target,
              # Path param: ID of the Plugin (prefixed `plugin_`).
              plugin_id:,
              # Header param: This endpoint is in beta: requests must send
              # `ce-plugins-2026-09-01` in this header.
              betas: nil,
              request_options: {}
            )
            end

            # Set or change an organization-owned Plugin's installation setting for the whole
            # organization or for one RBAC Group.
            #
            # Writing the value a target already holds of its own changes nothing.
            #
            # A member-owned Plugin has shares instead of installation settings, so this path
            # returns 404 for one.
            #
            # Send a Plugin's installation-setting writes one at a time. If several writes for
            # the same Plugin arrive at the same time, the server handles them one after
            # another and can answer some of them with `503` instead of applying them. That
            # `503` carries `x-should-retry: true`, and the write is safe to repeat: wait a
            # second or two, then send it again.
            #
            # **Accepted credentials:** an Admin API key with the `write:plugins` scope.
            #
            # Every request must include the beta header
            # `anthropic-beta: ce-plugins-2026-09-01`. A request without it returns `404`,
            # exactly as if the endpoint did not exist. The Plugins API is in beta and is
            # available to Claude Enterprise organizations only. It is not available to Claude
            # Platform (Claude Console) organizations, or to organizations with HIPAA
            # readiness enabled.
            sig do
              params(
                target: String,
                plugin_id: String,
                installation_preference:
                  Anthropic::Beta::Organization::Plugins::InstallationSettingSetParams::InstallationPreference::OrSymbol,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting
              )
            end
            def set(
              # Path param: The target whose setting is written: the literal `organization` for
              # the Plugin's organization-wide setting, or an RBAC Group's ID (prefixed
              # `rbac_group_`) for that group's own setting. Writing the `organization` target
              # stops the Plugin from inheriting its marketplace's default, even when the value
              # written equals that default.
              target,
              # Path param: ID of the Plugin (prefixed `plugin_`).
              plugin_id:,
              # Body param: The installation setting the target is to hold for this Plugin: one
              # of `required`, `auto_install`, `available`, `not_available`.
              installation_preference:,
              # Header param: This endpoint is in beta: requests must send
              # `ce-plugins-2026-09-01` in this header.
              betas: nil,
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
end
