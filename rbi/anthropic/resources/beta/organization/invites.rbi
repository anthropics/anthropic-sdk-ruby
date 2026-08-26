# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Invites
          # Invite a user to join the organization by email.
          #
          # On plans that draw members from a finite pool of purchased seats, the invite
          # automatically consumes a seat from the lowest tier with availability; there is
          # no seat-tier parameter. When no seat is free the request fails with a 400 error
          # rather than purchasing a seat.
          sig do
            params(
              email: String,
              role:
                Anthropic::Beta::Organization::InviteCreateParams::Role::OrSymbol,
              rbac_group_ids: T::Array[String],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaOrganizationInvite)
          end
          def create(
            # Email of the User.
            email:,
            # Role for the invited User.
            #
            # The accepted values depend on the organization type. Console and API
            # organizations accept `user`, `developer`, `billing`, and `claude_code_user`;
            # `admin` cannot be assigned through the API. Claude Enterprise organizations
            # accept `user` and `managed`.
            role:,
            # RBAC group IDs to assign to the User when the Invite is accepted. A non-empty
            # array is accepted only for a Claude Enterprise organization with RBAC groups,
            # and requires the key to carry the `write:rbac_groups` scope.
            rbac_group_ids: nil,
            request_options: {}
          )
          end

          # Retrieve an invite by ID.
          sig do
            params(
              invite_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Organization::BetaOrganizationInvite)
          end
          def retrieve(
            # ID of the Invite.
            invite_id,
            request_options: {}
          )
          end

          # List the organization's invites.
          sig do
            params(
              after_id: String,
              before_id: String,
              email: String,
              limit: Integer,
              roles: T::Array[String],
              statuses:
                T::Array[
                  Anthropic::Beta::Organization::InviteListParams::Status::OrSymbol
                ],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::Page[
                Anthropic::Beta::Organization::BetaOrganizationInvite
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
            # Filter by the email address the Invite was sent to. Matches the same way as the
            # Users list's `email` filter (normalized, case-insensitive).
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
            # Filter by Invite status. Repeatable; values are OR'ed together. Omit to return
            # `pending`, `accepted`, and `expired` Invites alike.
            statuses: nil,
            request_options: {}
          )
          end

          # Delete a pending invite.
          sig do
            params(
              invite_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Models::Beta::Organization::InviteDeleteResponse
            )
          end
          def delete(
            # ID of the Invite.
            invite_id,
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
