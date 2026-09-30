# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class RBACGroups
          sig do
            returns(
              Anthropic::Resources::Beta::Organization::RBACGroups::Members
            )
          end
          attr_reader :members

          # Create an RBAC Group in the Claude Enterprise tenant. Groups created via the API
          # have source type `"direct"`.
          #
          # The RBAC Groups API is available to Claude Enterprise organizations only.
          sig do
            params(
              name: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaRBACGroup)
          end
          def create(
            # Name of the RBAC Group. Not uniqueness-enforced.
            name:,
            request_options: {}
          )
          end

          # Retrieve an RBAC Group by ID.
          #
          # The RBAC Groups API is available to Claude Enterprise organizations only.
          sig do
            params(
              rbac_group_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaRBACGroup)
          end
          def retrieve(
            # ID of the RBAC Group.
            rbac_group_id,
            request_options: {}
          )
          end

          # Update an RBAC Group's name. Groups provisioned by an identity provider (source
          # type `"scim"`) cannot be modified via the API while an organization in the
          # tenant uses SCIM provisioning.
          #
          # The RBAC Groups API is available to Claude Enterprise organizations only.
          sig do
            params(
              rbac_group_id: String,
              name: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaRBACGroup)
          end
          def update(
            # ID of the RBAC Group.
            rbac_group_id,
            # Name of the RBAC Group. Not uniqueness-enforced.
            name: nil,
            request_options: {}
          )
          end

          # List RBAC Groups in the Claude Enterprise tenant.
          #
          # The RBAC Groups API is available to Claude Enterprise organizations only.
          sig do
            params(
              limit: Integer,
              page: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Organization::BetaRBACGroup
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

          # Delete an RBAC Group. Groups provisioned by an identity provider (source type
          # `"scim"`) cannot be deleted via the API while an organization in the tenant uses
          # SCIM provisioning.
          #
          # The RBAC Groups API is available to Claude Enterprise organizations only.
          sig do
            params(
              rbac_group_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Models::Beta::Organization::RBACGroupDeleteResponse
            )
          end
          def delete(
            # ID of the RBAC Group.
            rbac_group_id,
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
