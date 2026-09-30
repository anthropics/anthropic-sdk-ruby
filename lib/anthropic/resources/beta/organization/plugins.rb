# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Plugins
          # @return [Anthropic::Resources::Beta::Organization::Plugins::Versions]
          attr_reader :versions

          # @return [Anthropic::Resources::Beta::Organization::Plugins::InstallationSettings]
          attr_reader :installation_settings

          # @return [Anthropic::Resources::Beta::Organization::Plugins::Shares]
          attr_reader :shares

          # Create an organization-owned Plugin and its first version by uploading the
          # version's files.
          #
          # The upload is `multipart/form-data`: the version's files (`files`, each part
          # sent as `files[]`), with an optional `marketplace_id` and `release_notes`. The
          # manifest's `name` becomes the Plugin's `name`, and `display_name`, `description`
          # and `manifest_version` come from the manifest too.
          #
          # `name` may contain lowercase letters (from any alphabet), digits, and hyphens,
          # up to 64 characters. Uppercase letters, spaces, underscores, and other
          # punctuation are rejected.
          #
          # The `name` must be unique within the marketplace: a name already taken returns a
          # 409 with `error_code` `plugin_name_taken` and, when a Plugin holds it, that
          # Plugin's ID in `details.plugin_id`. A Plugin going into the organization's
          # library marketplace is also refused with a 409 when one of its skills has the
          # name of an organization skill (a skill an administrator uploaded for the whole
          # organization in claude.ai): `error_code` `skill_name_taken`, with that name in
          # `details.skill_name`; rename the skill, or remove the organization skill in
          # claude.ai. A 503 with `error_code` `registration_pending` means the Plugin and
          # its version were stored (their IDs are in `details`) but are not yet usable in
          # claude.ai: do not retry the create (the retry would return `plugin_name_taken`);
          # create a version on the stored Plugin instead, which completes it.
          #
          # For a worked example, see
          # [Create a plugin](/docs/en/manage-claude/plugins-api#create-a-plugin) in the
          # Plugins API guide.
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
          # {Anthropic::Models::Beta::Organization::PluginCreateParams} for more details.
          #
          # @overload create(files:, marketplace_id: nil, release_notes: nil, betas: nil, request_options: {})
          #
          # @param files [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>] Body param: The version's files: one part per file, the part's filename being th
          #
          # @param marketplace_id [String] Body param: ID of the organization-owned plugin marketplace to create the Plugin
          #
          # @param release_notes [String] Body param: Release notes stored with the version and shown in its version histo
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaPlugin]
          #
          # @see Anthropic::Models::Beta::Organization::PluginCreateParams
          def create(params)
            parsed, options = Anthropic::Beta::Organization::PluginCreateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: "v1/organizations/plugins?beta=true",
              headers: {
                "content-type" => "multipart/form-data",
                **parsed.slice(*header_params.keys)
              }.transform_keys(
                header_params
              ),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaPlugin,
              options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
            )
          end

          # Retrieve a Plugin by ID.
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
          # {Anthropic::Models::Beta::Organization::PluginRetrieveParams} for more details.
          #
          # @overload retrieve(plugin_id, organization_id: nil, betas: nil, request_options: {})
          #
          # @param plugin_id [String] Path param: ID of the Plugin (prefixed `plugin_`).
          #
          # @param organization_id [String, nil] Query param: For a `read:org_audit` or `read:compliance_org_data` key created fo
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaPlugin]
          #
          # @see Anthropic::Models::Beta::Organization::PluginRetrieveParams
          def retrieve(plugin_id, params = {})
            query_params = [:organization_id]
            parsed, options = Anthropic::Beta::Organization::PluginRetrieveParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/organizations/plugins/%1$s?beta=true", plugin_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaPlugin,
              options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
            )
          end

          # Change which stored version of an organization-owned Plugin is served to
          # members, for example to roll back to an earlier one. This pins the served
          # version: later uploads are stored but no longer change what is served, and
          # pinning cannot currently be undone, here or in claude.ai.
          #
          # Pass the version as `served_version_id`: an earlier one to roll back, a later
          # one to start serving a version that was stored without being served, or the one
          # already served to pin it without changing what is served. No new version is
          # created.
          #
          # When the organization has content scanning enabled, a version whose scan is
          # still running is refused with a 409 (`error_code` `scan_pending`; retry once the
          # scan finishes) and one whose scan failed, errored or reached no verdict with a
          # 400 (`scan_failed`; a `warn` is accepted). When the Plugin is in the
          # organization's library marketplace, a version other than the one served is also
          # refused with a 409 when one of its skills has a name that an organization skill
          # (one an administrator uploaded for the whole organization in claude.ai) has
          # since taken: `error_code` `skill_name_taken`, with that name in
          # `details.skill_name`. A member-owned Plugin cannot be updated here (403).
          #
          # This endpoint does not write installation settings; they are written at
          # `/v1/organizations/plugins/{plugin_id}/installation_settings/{target}`.
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
          # {Anthropic::Models::Beta::Organization::PluginUpdateParams} for more details.
          #
          # @overload update(plugin_id, served_version_id:, betas: nil, request_options: {})
          #
          # @param plugin_id [String] Path param: ID of the Plugin (prefixed `plugin_`).
          #
          # @param served_version_id [String] Body param: Serve this version of the Plugin (prefixed `pluginver_`) and pin the
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaPlugin]
          #
          # @see Anthropic::Models::Beta::Organization::PluginUpdateParams
          def update(plugin_id, params)
            parsed, options = Anthropic::Beta::Organization::PluginUpdateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: ["v1/organizations/plugins/%1$s?beta=true", plugin_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaPlugin,
              options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
            )
          end

          # List the Plugins created under the organization, newest first: those in the
          # organization's own plugin marketplaces and those in members' personal plugin
          # marketplaces.
          #
          # Plugins in members' personal marketplaces are listed with the same detail as the
          # organization's own, and their files can be downloaded through the version
          # archive endpoint, which records each such download on the Compliance API
          # activity feed.
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
          # {Anthropic::Models::Beta::Organization::PluginListParams} for more details.
          #
          # @overload list(created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, limit: nil, marketplace_id: nil, organization_id: nil, owner_type: nil, owner_user_id: nil, page: nil, betas: nil, request_options: {})
          #
          # @param created_at_gt [Time, nil] Query param: RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          #
          # @param created_at_gte [Time, nil] Query param: RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          #
          # @param created_at_lt [Time, nil] Query param: RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          #
          # @param created_at_lte [Time, nil] Query param: RFC 3339 timestamp bound; combine [gte], [gt], [lte], [lt].
          #
          # @param limit [Integer] Query param: Number of items to return per page.
          #
          # @param marketplace_id [String, nil] Query param: Only Plugins in this plugin marketplace (prefixed `marketplace_`).
          #
          # @param organization_id [String, nil] Query param: For a `read:org_audit` or `read:compliance_org_data` key created fo
          #
          # @param owner_type [Symbol, Anthropic::Models::Beta::Organization::PluginListParams::OwnerType, nil] Query param: `organization` for Plugins in the organization's plugin marketplace
          #
          # @param owner_user_id [String, nil] Query param: Only Plugins in this member's personal plugin marketplaces (prefixe
          #
          # @param page [String, nil] Query param: Optionally set to the `next_page` token from the previous response.
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaPlugin>]
          #
          # @see Anthropic::Models::Beta::Organization::PluginListParams
          def list(params = {})
            query_params =
              [
                :created_at_gt,
                :created_at_gte,
                :created_at_lt,
                :created_at_lte,
                :limit,
                :marketplace_id,
                :organization_id,
                :owner_type,
                :owner_user_id,
                :page
              ]
            parsed, options = Anthropic::Beta::Organization::PluginListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: "v1/organizations/plugins?beta=true",
              query: query.transform_keys(
                created_at_gt: "created_at[gt]",
                created_at_gte: "created_at[gte]",
                created_at_lt: "created_at[lt]",
                created_at_lte: "created_at[lte]"
              ),
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Organization::BetaPlugin,
              options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
            )
          end

          # Permanently delete a Plugin and every version it holds, exactly as when an
          # administrator deletes it in claude.ai. The Plugin may belong to the organization
          # or to a member, including a member who has since left the organization.
          #
          # An organization-owned Plugin's installation settings go with it; a member-owned
          # Plugin's shares are withdrawn and its owner no longer has it.
          #
          # To take an organization-owned Plugin out of use reversibly, set its
          # organization-wide installation setting to `not_available` instead (and remove or
          # change any group settings, which override it for their members). Only a Plugin
          # in a `manual` marketplace can be deleted here; one synchronized from a
          # repository is removed by removing it from the repository (400).
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
          # {Anthropic::Models::Beta::Organization::PluginDeleteParams} for more details.
          #
          # @overload delete(plugin_id, betas: nil, request_options: {})
          #
          # @param plugin_id [String] ID of the Plugin (prefixed `plugin_`).
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `ce-plugins-2026-09-01` in this hea
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaDeletedPlugin]
          #
          # @see Anthropic::Models::Beta::Organization::PluginDeleteParams
          def delete(plugin_id, params = {})
            parsed, options = Anthropic::Beta::Organization::PluginDeleteParams.dump_request(params)
            @client.request(
              method: :delete,
              path: ["v1/organizations/plugins/%1$s?beta=true", plugin_id],
              headers: parsed.transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaDeletedPlugin,
              options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @versions = Anthropic::Resources::Beta::Organization::Plugins::Versions.new(client: client)
            @installation_settings =
              Anthropic::Resources::Beta::Organization::Plugins::InstallationSettings.new(client: client)
            @shares = Anthropic::Resources::Beta::Organization::Plugins::Shares.new(client: client)
          end
        end
      end
    end
  end
end
