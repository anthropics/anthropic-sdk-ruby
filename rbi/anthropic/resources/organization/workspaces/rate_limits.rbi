# typed: strong

module Anthropic
  module Resources
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
