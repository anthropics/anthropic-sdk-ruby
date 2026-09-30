# typed: strong

module Anthropic
  module Models
    OrganizationInvite = Organization::OrganizationInvite

    module Organization
      class OrganizationInvite < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::OrganizationInvite,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the Invite.
        sig { returns(String) }
        attr_accessor :id

        # RFC 3339 datetime string indicating when the Invite was accepted, or null.
        sig { returns(T.nilable(Time)) }
        attr_accessor :accepted_at

        # Email of the User being invited.
        sig { returns(String) }
        attr_accessor :email

        # RFC 3339 datetime string indicating when the Invite expires.
        sig { returns(Time) }
        attr_accessor :expires_at

        # RFC 3339 datetime string indicating when the Invite was created.
        sig { returns(Time) }
        attr_accessor :invited_at

        # RBAC group IDs recorded on the Invite (Claude Enterprise organizations), to be
        # assigned to the User when the Invite is accepted. `[]` when none.
        sig { returns(T::Array[String]) }
        attr_accessor :rbac_group_ids

        # Organization role of the User.
        sig { returns(Anthropic::OrganizationRole::TaggedSymbol) }
        attr_accessor :role

        # Status of the Invite.
        sig do
          returns(
            Anthropic::Organization::OrganizationInvite::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Object type.
        #
        # For Invites, this is always `"invite"`.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            accepted_at: T.nilable(Time),
            email: String,
            expires_at: Time,
            invited_at: Time,
            rbac_group_ids: T::Array[String],
            role: Anthropic::OrganizationRole::OrSymbol,
            status:
              Anthropic::Organization::OrganizationInvite::Status::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the Invite.
          id:,
          # RFC 3339 datetime string indicating when the Invite was accepted, or null.
          accepted_at:,
          # Email of the User being invited.
          email:,
          # RFC 3339 datetime string indicating when the Invite expires.
          expires_at:,
          # RFC 3339 datetime string indicating when the Invite was created.
          invited_at:,
          # RBAC group IDs recorded on the Invite (Claude Enterprise organizations), to be
          # assigned to the User when the Invite is accepted. `[]` when none.
          rbac_group_ids:,
          # Organization role of the User.
          role:,
          # Status of the Invite.
          status:,
          # Object type.
          #
          # For Invites, this is always `"invite"`.
          type: :invite
        )
        end

        sig do
          override.returns(
            {
              id: String,
              accepted_at: T.nilable(Time),
              email: String,
              expires_at: Time,
              invited_at: Time,
              rbac_group_ids: T::Array[String],
              role: Anthropic::OrganizationRole::TaggedSymbol,
              status:
                Anthropic::Organization::OrganizationInvite::Status::TaggedSymbol,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        # Status of the Invite.
        module Status
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Organization::OrganizationInvite::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACCEPTED =
            T.let(
              :accepted,
              Anthropic::Organization::OrganizationInvite::Status::TaggedSymbol
            )
          DELETED =
            T.let(
              :deleted,
              Anthropic::Organization::OrganizationInvite::Status::TaggedSymbol
            )
          EXPIRED =
            T.let(
              :expired,
              Anthropic::Organization::OrganizationInvite::Status::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Anthropic::Organization::OrganizationInvite::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::OrganizationInvite::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
