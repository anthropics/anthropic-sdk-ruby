# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class PluginMarketplaces
          # Retrieve a plugin marketplace by ID.
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
          # {Anthropic::Models::Beta::Organization::PluginMarketplaceRetrieveParams} for
          # more details.
          #
          # @overload retrieve(marketplace_id, organization_id: nil, betas: nil, request_options: {})
          #
          # @param marketplace_id [String] Path param: ID of the plugin marketplace (prefixed `marketplace_`).
          #
          # @param organization_id [String, nil] Query param: For a `read:org_audit` or `read:compliance_org_data` key created fo
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaPluginMarketplace]
          #
          # @see Anthropic::Models::Beta::Organization::PluginMarketplaceRetrieveParams
          def retrieve(marketplace_id, params = {})
            query_params = [:organization_id]
            parsed, options = Anthropic::Beta::Organization::PluginMarketplaceRetrieveParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: ["v1/organizations/plugin_marketplaces/%1$s?beta=true", marketplace_id],
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              model: Anthropic::Beta::Organization::BetaPluginMarketplace,
              options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
            )
          end

          # Set the default installation setting of one of the organization's own plugin
          # marketplaces. Every Plugin in it without a setting of its own gets this default
          # as its organization-wide setting, including Plugins added later.
          #
          # Pass it as `default_installation_preference`. A member's personal marketplace
          # cannot be updated here (403).
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
          # {Anthropic::Models::Beta::Organization::PluginMarketplaceUpdateParams} for more
          # details.
          #
          # @overload update(marketplace_id, default_installation_preference:, betas: nil, request_options: {})
          #
          # @param marketplace_id [String] Path param: ID of the plugin marketplace (prefixed `marketplace_`).
          #
          # @param default_installation_preference [Symbol, Anthropic::Models::Beta::Organization::PluginMarketplaceUpdateParams::DefaultInstallationPreference] Body param: The organization-wide installation setting every Plugin in the marke
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaPluginMarketplace]
          #
          # @see Anthropic::Models::Beta::Organization::PluginMarketplaceUpdateParams
          def update(marketplace_id, params)
            parsed, options = Anthropic::Beta::Organization::PluginMarketplaceUpdateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: ["v1/organizations/plugin_marketplaces/%1$s?beta=true", marketplace_id],
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaPluginMarketplace,
              options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
            )
          end

          # List the plugin marketplaces Plugins live in, newest first: the organization's
          # own and its members' personal ones.
          #
          # Plugin marketplaces are created, connected to a repository and deleted in
          # claude.ai, not through this API. The organization's library marketplace, the
          # organization-owned `manual` marketplace that uploads go to when no marketplace
          # is named, is created the first time something is put in it and is listed from
          # then on.
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
          # {Anthropic::Models::Beta::Organization::PluginMarketplaceListParams} for more
          # details.
          #
          # @overload list(limit: nil, organization_id: nil, owner_type: nil, page: nil, source: nil, betas: nil, request_options: {})
          #
          # @param limit [Integer] Query param: Number of items to return per page.
          #
          # @param organization_id [String, nil] Query param: For a `read:org_audit` or `read:compliance_org_data` key created fo
          #
          # @param owner_type [Symbol, Anthropic::Models::Beta::Organization::PluginMarketplaceListParams::OwnerType, nil] Query param: `organization` for the organization's plugin marketplaces, `user` f
          #
          # @param page [String, nil] Query param: Optionally set to the `next_page` token from the previous response.
          #
          # @param source [Symbol, Anthropic::Models::Beta::Organization::PluginMarketplaceListParams::Source, nil] Query param: Only plugin marketplaces with this `source`: `manual` for those who
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaPluginMarketplace>]
          #
          # @see Anthropic::Models::Beta::Organization::PluginMarketplaceListParams
          def list(params = {})
            query_params = [:limit, :organization_id, :owner_type, :page, :source]
            parsed, options = Anthropic::Beta::Organization::PluginMarketplaceListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
            @client.request(
              method: :get,
              path: "v1/organizations/plugin_marketplaces?beta=true",
              query: query,
              headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Organization::BetaPluginMarketplace,
              options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
            )
          end

          # Check whether a plugin marketplace, uploaded as a `.zip` of the marketplace
          # directory, would synchronize into claude.ai, without connecting or storing it.
          #
          # To check a public GitHub repository instead, use Validate Plugin Marketplace
          # Repository.
          #
          # The report says whether `marketplace.json` is well-formed, which plugins a
          # synchronization would skip and why, and which plugins would synchronize only in
          # part, with some files left out. An archive that cannot be read as a marketplace
          # is reported, not refused: the response is a report with `valid: false`. Plugin
          # sources outside the marketplace are fetched anonymously from GitHub, so a
          # private one is reported as not found; a source on any other host is not fetched
          # here, and the report notes that it will be checked when the marketplace actually
          # synchronizes.
          #
          # Nothing is recorded on the Compliance API activity feed.
          #
          # For a worked example, see
          # [Validate marketplace content](/docs/en/manage-claude/plugins-api#validate-marketplace-content)
          # in the Plugins API guide.
          #
          # **Accepted credentials:** an Admin API key with the `read:plugins` or
          # `write:plugins` scope; `read:org_audit` and `read:compliance_org_data` do not
          # grant it.
          #
          # Every request must include the beta header
          # `anthropic-beta: ce-plugins-2026-09-01`. A request without it returns `404`,
          # exactly as if the endpoint did not exist. The Plugins API is in beta and is
          # available to Claude Enterprise organizations only. It is not available to Claude
          # Platform (Claude Console) organizations, or to organizations with HIPAA
          # readiness enabled.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::PluginMarketplaceValidateArchiveParams}
          # for more details.
          #
          # @overload validate_archive(archive:, betas: nil, request_options: {})
          #
          # @param archive [Pathname, StringIO, IO, String, Anthropic::FilePart] Body param: A .zip of the marketplace directory (its contents at the root, or wr
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaPluginMarketplaceValidationReport]
          #
          # @see Anthropic::Models::Beta::Organization::PluginMarketplaceValidateArchiveParams
          def validate_archive(params)
            parsed, options =
              Anthropic::Beta::Organization::PluginMarketplaceValidateArchiveParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: "v1/organizations/plugin_marketplaces/validate_archive?beta=true",
              headers: {
                "content-type" => "multipart/form-data",
                **parsed.slice(*header_params.keys)
              }.transform_keys(
                header_params
              ),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaPluginMarketplaceValidationReport,
              options: {extra_headers: {"anthropic-beta" => "ce-plugins-2026-09-01"}, **options}
            )
          end

          # Check whether a plugin marketplace held in a public GitHub repository would
          # synchronize into claude.ai, without connecting or storing it.
          #
          # To check a `.zip` of the marketplace directory instead, use Validate Plugin
          # Marketplace Archive.
          #
          # The report says whether `marketplace.json` is well-formed, which plugins a
          # synchronization would skip and why, and which plugins would synchronize only in
          # part, with some files left out. A repository that is missing, private, or has no
          # such branch or commit is reported, not refused: the response is a report with
          # `valid: false`. Plugin sources outside the marketplace are fetched anonymously
          # from GitHub, so a private one is reported as not found; a source on any other
          # host is not fetched here, and the report notes that it will be checked when the
          # marketplace actually synchronizes.
          #
          # Nothing is recorded on the Compliance API activity feed.
          #
          # For a worked example, see
          # [Validate marketplace content](/docs/en/manage-claude/plugins-api#validate-marketplace-content)
          # in the Plugins API guide.
          #
          # **Accepted credentials:** an Admin API key with the `read:plugins` or
          # `write:plugins` scope; `read:org_audit` and `read:compliance_org_data` do not
          # grant it.
          #
          # Every request must include the beta header
          # `anthropic-beta: ce-plugins-2026-09-01`. A request without it returns `404`,
          # exactly as if the endpoint did not exist. The Plugins API is in beta and is
          # available to Claude Enterprise organizations only. It is not available to Claude
          # Platform (Claude Console) organizations, or to organizations with HIPAA
          # readiness enabled.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::PluginMarketplaceValidateRepositoryParams}
          # for more details.
          #
          # @overload validate_repository(repository_url:, ref: nil, betas: nil, request_options: {})
          #
          # @param repository_url [String] Body param: The `https://` URL of a public repository on github.com that holds t
          #
          # @param ref [String, nil] Body param: The branch to validate the tip of, or the full 40-character SHA of t
          #
          # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaPluginMarketplaceValidationReport]
          #
          # @see Anthropic::Models::Beta::Organization::PluginMarketplaceValidateRepositoryParams
          def validate_repository(params)
            parsed, options =
              Anthropic::Beta::Organization::PluginMarketplaceValidateRepositoryParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: "v1/organizations/plugin_marketplaces/validate_repository?beta=true",
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaPluginMarketplaceValidationReport,
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
