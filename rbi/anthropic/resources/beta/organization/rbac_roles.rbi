# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class RBACRoles
          sig do
            returns(
              Anthropic::Resources::Beta::Organization::RBACRoles::Permissions
            )
          end
          attr_reader :permissions

          # Retrieve an RBAC Role by ID.
          #
          # The RBAC Roles API is available to Claude Enterprise organizations only.
          sig do
            params(
              rbac_role_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaRBACRole)
          end
          def retrieve(
            # ID of the RBAC Role.
            rbac_role_id,
            request_options: {}
          )
          end

          # List RBAC Roles in the organization.
          #
          # The RBAC Roles API is available to Claude Enterprise organizations only.
          sig do
            params(
              limit: Integer,
              page: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Organization::BetaRBACRole
              ]
            )
          end
          def list(
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
