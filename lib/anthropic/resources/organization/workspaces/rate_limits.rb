# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      class Workspaces
        class RateLimits
          # Set or clear rate-limit overrides for one rate-limit group in a workspace.
          #
          # Only the limiter types named in `limits` change: an integer `value` sets that
          # type's override and `null` clears it. Types not named keep their current value.
          # A value above the organization's own limit is stored, but the organization limit
          # still applies, so the lower of the two is enforced.
          #
          # Returns the targeted group's entry with this request applied, in the shape
          # `GET /v1/organizations/workspaces/{workspace_id}/rate_limits` returns. Changes
          # take effect within about an hour.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Organization::Workspaces::RateLimitUpdateParams} for more
          # details.
          #
          # @overload update(rate_limit_id, workspace_id:, limits:, request_options: {})
          #
          # @param rate_limit_id [String] Path param: The `id` of the organization's rate-limit entry to set overrides for
          #
          # @param workspace_id [String] Path param: The ID of the workspace.
          #
          # @param limits [Array<Anthropic::Models::Organization::Workspaces::WorkspaceRateLimitUpdateValue>] Body param: Limits to set or clear. Unspecified limit types are unchanged.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::Workspaces::WorkspaceRateLimit]
          #
          # @see Anthropic::Models::Organization::Workspaces::RateLimitUpdateParams
          def update(rate_limit_id, params)
            parsed, options = Anthropic::Organization::Workspaces::RateLimitUpdateParams.dump_request(params)
            workspace_id =
              parsed.delete(:workspace_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WORKSPACES_RATE_LIMITS_UPDATE,
              span_attributes: {
                "anthropic.organization.workspace.id" => workspace_id,
                "anthropic.organization.workspace.rate_limit.id" => rate_limit_id
              },
              span_route: "/v1/organizations/workspaces/{workspace_id}/rate_limits/{rate_limit_id}",
              method: :post,
              path: ["v1/organizations/workspaces/%1$s/rate_limits/%2$s", workspace_id, rate_limit_id],
              body: parsed,
              model: Anthropic::Organization::Workspaces::WorkspaceRateLimit,
              options: options
            )
          end

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
          # {Anthropic::Models::Organization::Workspaces::RateLimitListParams} for more
          # details.
          #
          # @overload list(workspace_id, group_type: nil, include_inherited: nil, limit: nil, page: nil, request_options: {})
          #
          # @param workspace_id [String] The ID of the workspace.
          #
          # @param group_type [Symbol, Anthropic::Models::Organization::Workspaces::RateLimitListParams::GroupType, nil] Filter by group type.
          #
          # @param include_inherited [Boolean] Also list the limiter values the workspace inherits from the organization, inclu
          #
          # @param limit [Integer, nil] Maximum number of items to return per page. Ranges from `1` to `1000`.
          #
          # @param page [String, nil] Opaque cursor from a previous response's `next_page`.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Organization::Workspaces::WorkspaceRateLimit>]
          #
          # @see Anthropic::Models::Organization::Workspaces::RateLimitListParams
          def list(workspace_id, params = {})
            parsed, options = Anthropic::Organization::Workspaces::RateLimitListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed)
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_WORKSPACES_RATE_LIMITS_LIST,
              span_attributes: {"anthropic.organization.workspace.id" => workspace_id},
              span_route: "/v1/organizations/workspaces/{workspace_id}/rate_limits",
              span_query: %w[group_type include_inherited limit page],
              method: :get,
              path: ["v1/organizations/workspaces/%1$s/rate_limits", workspace_id],
              query: query,
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Organization::Workspaces::WorkspaceRateLimit,
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
