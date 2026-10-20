# typed: strong

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
          sig do
            params(
              rate_limit_id: String,
              workspace_id: String,
              limits:
                T::Array[
                  Anthropic::Organization::Workspaces::WorkspaceRateLimitUpdateValue::OrHash
                ],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Organization::Workspaces::WorkspaceRateLimit)
          end
          def update(
            # Path param: The `id` of the organization's rate-limit entry to set overrides
            # for.
            rate_limit_id,
            # Path param: The ID of the workspace.
            workspace_id:,
            # Body param: Limits to set or clear. Unspecified limit types are unchanged.
            limits:,
            request_options: {}
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
          sig do
            params(
              workspace_id: String,
              group_type:
                T.nilable(
                  Anthropic::Organization::Workspaces::RateLimitListParams::GroupType::OrSymbol
                ),
              include_inherited: T::Boolean,
              limit: T.nilable(Integer),
              page: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Organization::Workspaces::WorkspaceRateLimit
              ]
            )
          end
          def list(
            # The ID of the workspace.
            workspace_id,
            # Filter by group type.
            group_type: nil,
            # Also list the limiter values the workspace inherits from the organization,
            # including groups with no workspace-level override.
            include_inherited: nil,
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
