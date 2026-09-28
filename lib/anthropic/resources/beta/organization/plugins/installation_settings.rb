# frozen_string_literal: true

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
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Plugins::InstallationSettingListParams}
            # for more details.
            #
            # @overload list(plugin_id, limit: nil, organization_id: nil, page: nil, target_type: nil, betas: nil, request_options: {})
            #
            # @param plugin_id [String] Path param: ID of the Plugin (prefixed `plugin_`).
            #
            # @param limit [Integer] Query param: Number of items to return per page.
            #
            # @param organization_id [String, nil] Query param: For a `read:org_audit` or `read:compliance_org_data` key created fo
            #
            # @param page [String, nil] Query param: Optionally set to the `next_page` token from the previous response.
            #
            # @param target_type [Symbol, Anthropic::Models::Beta::Organization::Plugins::InstallationSettingListParams::TargetType, nil] Query param: Only settings for this kind of target: `organization` (the organiza
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::Plugins::BetaPluginInstallationSetting>]
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::InstallationSettingListParams
            def list(plugin_id, params = {})
              query_params = [:limit, :organization_id, :page, :target_type]
              parsed, options =
                Anthropic::Beta::Organization::Plugins::InstallationSettingListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                method: :get,
                path: ["v1/organizations/plugins/%1$s/installation_settings?beta=true", plugin_id],
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting,
                options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
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
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Plugins::InstallationSettingRemoveParams}
            # for more details.
            #
            # @overload remove(target, plugin_id:, betas: nil, request_options: {})
            #
            # @param target [String] Path param: The RBAC Group (ID prefixed `rbac_group_`) whose own setting is remo
            #
            # @param plugin_id [String] Path param: ID of the Plugin (prefixed `plugin_`).
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting]
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::InstallationSettingRemoveParams
            def remove(target, params)
              parsed, options =
                Anthropic::Beta::Organization::Plugins::InstallationSettingRemoveParams.dump_request(params)
              plugin_id =
                parsed.delete(:plugin_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :delete,
                path: [
                  "v1/organizations/plugins/%1$s/installation_settings/%2$s?beta=true",
                  plugin_id,
                  target
                ],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting,
                options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
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
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Plugins::InstallationSettingSetParams}
            # for more details.
            #
            # @overload set(target, plugin_id:, installation_preference:, betas: nil, request_options: {})
            #
            # @param target [String] Path param: The target whose setting is written: the literal `organization` for
            #
            # @param plugin_id [String] Path param: ID of the Plugin (prefixed `plugin_`).
            #
            # @param installation_preference [Symbol, Anthropic::Models::Beta::Organization::Plugins::InstallationSettingSetParams::InstallationPreference] Body param: The installation setting the target is to hold for this Plugin: one
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Plugins::BetaPluginInstallationSetting]
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::InstallationSettingSetParams
            def set(target, params)
              parsed, options =
                Anthropic::Beta::Organization::Plugins::InstallationSettingSetParams.dump_request(params)
              plugin_id =
                parsed.delete(:plugin_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              header_params = {betas: "anthropic-beta"}
              @client.request(
                method: :post,
                path: [
                  "v1/organizations/plugins/%1$s/installation_settings/%2$s?beta=true",
                  plugin_id,
                  target
                ],
                headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                body: parsed.except(*header_params.keys),
                model: Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting,
                options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
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
