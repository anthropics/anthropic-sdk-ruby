# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class RBACGroups
          class Members
            # List members of an RBAC Group.
            #
            # The RBAC Groups API is available to Claude Enterprise organizations only.
            sig do
              params(
                rbac_group_id: String,
                limit: Integer,
                page: T.nilable(String),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::RBACGroups::BetaRBACGroupMember
                ]
              )
            end
            def list(
              # ID of the RBAC Group.
              rbac_group_id,
              # Number of items to return per page.
              #
              # Defaults to `20`. Ranges from `1` to `1000`.
              limit: nil,
              # Optionally set to the `next_page` token from the previous response.
              page: nil,
              request_options: {}
            )
            end

            # Add a User to an RBAC Group. Membership of groups provisioned by an identity
            # provider (source type `"scim"`) cannot be modified via the API while an
            # organization in the tenant uses SCIM provisioning.
            #
            # The RBAC Groups API is available to Claude Enterprise organizations only.
            sig do
              params(
                rbac_group_id: String,
                user_id: String,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::RBACGroups::BetaRBACGroupMember
              )
            end
            def add(
              # ID of the RBAC Group.
              rbac_group_id,
              # ID of the User.
              user_id:,
              request_options: {}
            )
            end

            # Remove a User from an RBAC Group. Membership of groups provisioned by an
            # identity provider (source type `"scim"`) cannot be modified via the API while an
            # organization in the tenant uses SCIM provisioning.
            #
            # The RBAC Groups API is available to Claude Enterprise organizations only.
            sig do
              params(
                user_id: String,
                rbac_group_id: String,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Models::Beta::Organization::RBACGroups::MemberRemoveResponse
              )
            end
            def remove(
              # ID of the User.
              user_id,
              # ID of the RBAC Group.
              rbac_group_id:,
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
