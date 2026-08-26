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
            # This endpoint currently returns every matching entry in a single page regardless
            # of `limit`; follow `next_page` so that clients keep working when pagination is
            # enabled.
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
              # Accepted for request-shape compatibility and currently ignored: every entry is
              # returned in a single page.
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
