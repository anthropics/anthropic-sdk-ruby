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
            # accept `user` and `managed`; changing a User's role to `managed` requires the
            # `write:rbac_groups` scope in addition to `write:members`.
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

          # Sign a member out of Claude everywhere, without removing them from the
          # organization. This ends their sign-in sessions and removes their trusted devices
          # wherever they use Claude, including other organizations and individual plans. It
          # also ends the OAuth tokens issued to them for this organization, so apps such as
          # Claude Code must sign in again.
          #
          # A token can take up to an hour to stop working, though it almost always stops at
          # once. The member keeps their role and can sign in again right away. To keep them
          # out, remove them from the organization or, if your organization uses single
          # sign-on, block them in your identity provider. Signing out does not end API
          # keys, OAuth tokens that were not issued for this organization, or the member's
          # Claude Code cloud sessions and routines.
          #
          # You cannot sign out the organization's primary owner or the person your API key
          # or token acts for, and a request to sign out another owner, a member with owner
          # permissions, or a membership admin may be refused. A refused request returns a
          # `400` or `403` error that says why. If the request returns `503`, send it again
          # to finish; anything already ended stays ended.
          #
          # Every request must include the beta header
          # `anthropic-beta: admin-user-sign-out-2026-10-08`. A request without it returns
          # `400`. Sign-out is in beta. Anthropic turns it on for each organization and has
          # turned it on for every Claude Enterprise organization; until yours is on,
          # requests also return `400`. In a Claude Enterprise organization, an API key
          # needs the `write:members` scope; a key without it gets `403`.
          sig do
            params(
              user_id: String,
              betas:
                T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaOrganizationUser)
          end
          def sign_out(
            # ID of the User.
            user_id,
            # This endpoint is in beta: requests must send `admin-user-sign-out-2026-10-08` in
            # this header.
            betas: nil,
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
