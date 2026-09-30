# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class RBACRoles
          class Permissions
            # List the permissions an RBAC Role grants.
            #
            # The RBAC Roles API is available to Claude Enterprise organizations only.
            sig do
              params(
                rbac_role_id: String,
                limit: Integer,
                page: T.nilable(String),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACRolePermission
                ]
              )
            end
            def list(
              # ID of the RBAC Role.
              rbac_role_id,
              # Number of items to return per page.
              #
              # Defaults to `20`. Ranges from `1` to `1000`.
              limit: nil,
              # Optionally set to the `next_page` token from the previous response.
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
