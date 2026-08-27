# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Workspaces
          class RateLimits
            # List rate-limit overrides configured for a workspace.
            #
            # Returns only the groups and limiter types that have a workspace-level override.
            # Groups without overrides inherit the organization limits and are not listed; use
            # `GET /v1/organizations/rate_limits` to see those.
            #
            # When `limit` is omitted, every matching entry is returned in a single page; when
            # `limit` truncates the result, follow `next_page` to fetch the remaining entries.
            sig do
              params(
                workspace_id: String,
                group_type:
                  T.nilable(
                    Anthropic::Beta::Organization::Workspaces::RateLimitListParams::GroupType::OrSymbol
                  ),
                limit: T.nilable(Integer),
                page: T.nilable(String),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::Workspaces::BetaWorkspaceRateLimit
                ]
              )
            end
            def list(
              # The ID of the workspace.
              workspace_id,
              # Filter by group type.
              group_type: nil,
              # Maximum number of items to return per page. Ranges from `1` to `1000`.
              #
              # When omitted, every remaining entry is returned in a single page and `next_page`
              # is `null`.
              limit: nil,
              # Opaque cursor from a previous response's `next_page`.
              page: nil,
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
