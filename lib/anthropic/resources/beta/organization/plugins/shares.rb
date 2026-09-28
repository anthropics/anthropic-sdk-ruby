# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Plugins
          class Shares
            # List the shares the owner of a member-owned Plugin has given — to every member
            # of the organization, to an RBAC Group, or to one member — most recently granted
            # first.
            #
            # Shares are read-only in this API: members give and withdraw them in claude.ai,
            # and who gave a share is recorded on the Compliance API activity feed rather than
            # on the share. An organization-owned Plugin has installation settings instead, so
            # this path returns 404 for one.
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
            # {Anthropic::Models::Beta::Organization::Plugins::ShareListParams} for more
            # details.
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
            # @param target_type [Symbol, Anthropic::Models::Beta::Organization::Plugins::ShareListParams::TargetType, nil] Query param: Only shares with this kind of target: `organization` (every member)
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `ce-plugins-2026-09-0
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::Plugins::BetaPluginShare>]
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::ShareListParams
            def list(plugin_id, params = {})
              query_params = [:limit, :organization_id, :page, :target_type]
              parsed, options = Anthropic::Beta::Organization::Plugins::ShareListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                method: :get,
                path: ["v1/organizations/plugins/%1$s/shares?beta=true", plugin_id],
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::Plugins::BetaPluginShare,
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
