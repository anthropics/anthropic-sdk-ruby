# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Workspaces
          class RateLimits
            # List a workspace's rate limits.
            #
            # By default, returns only the groups and limiter types that have a
            # workspace-level override. With `include_inherited=true`, returns every group
            # with organization-level limits the workspace can see, listing for each the
            # values it inherits from the organization as well as its own overrides. Each
            # value's `source` says which it is.
            #
            # When `limit` is omitted, every matching entry is returned in a single page; when
            # `limit` truncates the result, follow `next_page` to fetch the remaining entries.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Workspaces::RateLimitListParams} for
            # more details.
            #
            # @overload list(workspace_id, group_type: nil, include_inherited: nil, limit: nil, page: nil, request_options: {})
            #
            # @param workspace_id [String] The ID of the workspace.
            #
            # @param group_type [Symbol, Anthropic::Models::Beta::Organization::Workspaces::RateLimitListParams::GroupType, nil] Filter by group type.
            #
            # @param include_inherited [Boolean] Also list the limiter values the workspace inherits from the organization, inclu
            #
            # @param limit [Integer, nil] Maximum number of items to return per page. Ranges from `1` to `1000`.
            #
            # @param page [String, nil] Opaque cursor from a previous response's `next_page`.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::Workspaces::BetaWorkspaceRateLimit>]
            #
            # @see Anthropic::Models::Beta::Organization::Workspaces::RateLimitListParams
            def list(workspace_id, params = {})
              parsed, options = Anthropic::Beta::Organization::Workspaces::RateLimitListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed)
              @client.request(
                method: :get,
                path: ["v1/organizations/workspaces/%1$s/rate_limits?beta=true", workspace_id],
                query: query,
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit,
                options: options
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
