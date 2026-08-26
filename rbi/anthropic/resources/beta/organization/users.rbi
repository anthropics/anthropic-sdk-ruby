# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Users
          # Retrieve a member of the organization by user ID.
          sig do
            params(
              user_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaOrganizationUser)
          end
          def retrieve(
            # ID of the User.
            user_id,
            request_options: {}
          )
          end

          # Update a member's organization role.
          sig do
            params(
              user_id: String,
              role:
                Anthropic::Beta::Organization::UserUpdateParams::Role::OrSymbol,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaOrganizationUser)
          end
          def update(
            # ID of the User.
            user_id,
            # New role for the User.
            #
            # The accepted values depend on the organization type. Console and API
            # organizations accept `user`, `developer`, `billing`, and `claude_code_user`;
            # `admin` cannot be assigned through the API. Claude Enterprise organizations
            # accept `user` and `managed`.
            role:,
            request_options: {}
          )
          end

          # List the organization's members.
          sig do
            params(
              after_id: String,
              before_id: String,
              email: String,
              limit: Integer,
              roles: T::Array[String],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::Page[
                Anthropic::Beta::Organization::BetaOrganizationUser
              ]
            )
          end
          def list(
            # ID of the object to use as a cursor for pagination. When provided, returns the
            # page of results immediately after this object.
            after_id: nil,
            # ID of the object to use as a cursor for pagination. When provided, returns the
            # page of results immediately before this object.
            before_id: nil,
            # Filter by user email.
            email: nil,
            # Number of items to return per page.
            #
            # Defaults to `20`. Ranges from `1` to `1000`.
            limit: nil,
            # Filter to items whose `role` equals one of the supplied values. Repeatable;
            # values are OR'ed together.
            #
            # Accepted values depend on the organization type: Console and API organizations
            # accept `user`, `developer`, `billing`, `admin`, and `claude_code_user`; Claude
            # Enterprise organizations accept `user`, `owner`, `primary_owner`,
            # `membership_admin`, and `managed`.
            roles: nil,
            request_options: {}
          )
          end

          # Remove a member from the organization.
          sig do
            params(
              user_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Models::Beta::Organization::UserRemoveResponse)
          end
          def remove(
            # ID of the User.
            user_id,
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
