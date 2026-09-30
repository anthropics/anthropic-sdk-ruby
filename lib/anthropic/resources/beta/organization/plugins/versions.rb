# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Plugins
          class Versions
            # Add a version to an organization-owned Plugin by uploading the new version's
            # files; it becomes the version served to members unless the Plugin's served
            # version has been pinned.
            #
            # The upload is the same `multipart/form-data` as creating a Plugin: the version's
            # files (`files`, each part sent as `files[]`) and optional `release_notes`. The
            # uploaded manifest's `name` must equal the Plugin's `name`. Returns the stored
            # version; read the Plugin back to see which version it serves.
            #
            # Only a Plugin in a `manual` marketplace takes uploads; a Plugin synchronized
            # from a repository gets its versions from the repository. When the Plugin is in
            # the organization's library marketplace, a version that adds a skill with the
            # name of an organization skill (a skill an administrator uploaded for the whole
            # organization in claude.ai) is refused with a 409: `error_code`
            # `skill_name_taken`, with that name in `details.skill_name`. A 503 with
            # `error_code` `registration_pending` means the version was stored but is not yet
            # usable; a later version create on the Plugin completes it.
            #
            # For a worked example, see
            # [Create a version](/docs/en/manage-claude/plugins-api#create-a-version) in the
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
            # {Anthropic::Models::Beta::Organization::Plugins::VersionCreateParams} for more
            # details.
            #
            # @overload create(plugin_id, files:, release_notes: nil, betas: nil, request_options: {})
            #
            # @param plugin_id [String] Path param: ID of the Plugin (prefixed `plugin_`).
            #
            # @param files [Array<Pathname, StringIO, IO, String, Anthropic::FilePart>] Body param: The version's files: one part per file, the part's filename being th
            #
            # @param release_notes [String] Body param: Release notes stored with the version and shown in its version histo
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Plugins::BetaPluginVersion]
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::VersionCreateParams
            def create(plugin_id, params)
              parsed, options = Anthropic::Beta::Organization::Plugins::VersionCreateParams.dump_request(params)
              header_params = {betas: "anthropic-beta"}
              @client.request(
                method: :post,
                path: ["v1/organizations/plugins/%1$s/versions?beta=true", plugin_id],
                headers: {
                  "content-type" => "multipart/form-data",
                  **parsed.slice(*header_params.keys)
                }.transform_keys(
                  header_params
                ),
                body: parsed.except(*header_params.keys),
                model: Anthropic::Beta::Organization::Plugins::BetaPluginVersion,
                options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
              )
            end

            # Retrieve one version of a Plugin by its ID, or the Plugin's newest version.
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
            # {Anthropic::Models::Beta::Organization::Plugins::VersionRetrieveParams} for more
            # details.
            #
            # @overload retrieve(version, plugin_id:, organization_id: nil, betas: nil, request_options: {})
            #
            # @param version [String] Path param: ID of the Plugin Version (prefixed `pluginver_`), or `latest` for th
            #
            # @param plugin_id [String] Path param: ID of the Plugin (prefixed `plugin_`).
            #
            # @param organization_id [String, nil] Query param: For a `read:org_audit` or `read:compliance_org_data` key created fo
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::Plugins::BetaPluginVersion]
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::VersionRetrieveParams
            def retrieve(version, params)
              query_params = [:organization_id]
              parsed, options = Anthropic::Beta::Organization::Plugins::VersionRetrieveParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              plugin_id =
                parsed.delete(:plugin_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :get,
                path: ["v1/organizations/plugins/%1$s/versions/%2$s?beta=true", plugin_id, version],
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Organization::Plugins::BetaPluginVersion,
                options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
              )
            end

            # List a Plugin's versions, newest first.
            #
            # The first item of the first page is the version the Plugin's `latest_version_id`
            # refers to.
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
            # {Anthropic::Models::Beta::Organization::Plugins::VersionListParams} for more
            # details.
            #
            # @overload list(plugin_id, limit: nil, organization_id: nil, page: nil, betas: nil, request_options: {})
            #
            # @param plugin_id [String] Path param: ID of the Plugin (prefixed `plugin_`).
            #
            # @param limit [Integer] Query param: Number of items to return per page.
            #
            # @param organization_id [String, nil] Query param: For a `read:org_audit` or `read:compliance_org_data` key created fo
            #
            # @param page [String, nil] Query param: Optionally set to the `next_page` token from the previous response.
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::Plugins::BetaPluginVersion>]
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::VersionListParams
            def list(plugin_id, params = {})
              query_params = [:limit, :organization_id, :page]
              parsed, options = Anthropic::Beta::Organization::Plugins::VersionListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                method: :get,
                path: ["v1/organizations/plugins/%1$s/versions?beta=true", plugin_id],
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::Plugins::BetaPluginVersion,
                options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
              )
            end

            # Download one version's `.zip` archive, exactly as stored. Each download of a
            # Plugin from a member's personal plugin marketplace is recorded on the Compliance
            # API activity feed.
            #
            # The response body is the archive (`Content-Type: application/zip`), sent as an
            # attachment whose filename is derived from the Plugin's name; name saved files
            # from the IDs in the request path, since that filename is not unique.
            #
            # **Accepted credentials:** an Admin API key with the `read:plugins` or
            # `read:org_audit` scope, or a Compliance Access Key with the
            # `read:compliance_org_data` scope.
            #
            # Every read scope above (`read:plugins`, `read:org_audit`, and
            # `read:compliance_org_data`) can download the files of plugins in members'
            # personal marketplaces, including files that claude.ai's admin settings do not
            # show, and a `read:org_audit` or `read:compliance_org_data` key created for all
            # of your parent organization's linked organizations can do this in any
            # organization under it that has access to this API, by passing `organization_id`.
            # Each such download records a `claude_plugin_archive_accessed` event on the
            # Compliance API activity feed, identifying the key, the plugin, the version, and
            # the member. Downloads of organization-owned plugins are not recorded.
            #
            # Every request must include the beta header
            # `anthropic-beta: ce-plugins-2026-09-01`. A request without it returns `404`,
            # exactly as if the endpoint did not exist. The Plugins API is in beta and is
            # available to Claude Enterprise organizations only. It is not available to Claude
            # Platform (Claude Console) organizations, or to organizations with HIPAA
            # readiness enabled.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Plugins::VersionDownloadParams} for more
            # details.
            #
            # @overload download(version, plugin_id:, organization_id: nil, betas: nil, request_options: {})
            #
            # @param version [String] Path param: ID of the Plugin Version (prefixed `pluginver_`). `latest` is not ac
            #
            # @param plugin_id [String] Path param: ID of the Plugin (prefixed `plugin_`).
            #
            # @param organization_id [String, nil] Query param: For a `read:org_audit` or `read:compliance_org_data` key created fo
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [StringIO]
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::VersionDownloadParams
            def download(version, params)
              query_params = [:organization_id]
              parsed, options = Anthropic::Beta::Organization::Plugins::VersionDownloadParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              plugin_id =
                parsed.delete(:plugin_id) do
                  raise ArgumentError.new("missing required path argument #{_1}")
                end
              @client.request(
                method: :get,
                path: ["v1/organizations/plugins/%1$s/versions/%2$s/content?beta=true", plugin_id, version],
                query: query,
                headers: {
                  "accept" => "application/binary",
                  **parsed.except(*query_params)
                }.transform_keys(betas: "anthropic-beta"),
                model: StringIO,
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
