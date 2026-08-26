# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationInvite < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaOrganizationInvite,
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
          sig { returns(Anthropic::Beta::BetaOrganizationRole::TaggedSymbol) }
          attr_accessor :role

          # Status of the Invite.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaOrganizationInvite::Status::TaggedSymbol
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
              role: Anthropic::Beta::BetaOrganizationRole::OrSymbol,
              status:
                Anthropic::Beta::Organization::BetaOrganizationInvite::Status::OrSymbol,
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
                role: Anthropic::Beta::BetaOrganizationRole::TaggedSymbol,
                status:
                  Anthropic::Beta::Organization::BetaOrganizationInvite::Status::TaggedSymbol,
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
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaOrganizationInvite::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACCEPTED =
              T.let(
                :accepted,
                Anthropic::Beta::Organization::BetaOrganizationInvite::Status::TaggedSymbol
              )
            DELETED =
              T.let(
                :deleted,
                Anthropic::Beta::Organization::BetaOrganizationInvite::Status::TaggedSymbol
              )
            EXPIRED =
              T.let(
                :expired,
                Anthropic::Beta::Organization::BetaOrganizationInvite::Status::TaggedSymbol
              )
            PENDING =
              T.let(
                :pending,
                Anthropic::Beta::Organization::BetaOrganizationInvite::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaOrganizationInvite::Status::TaggedSymbol
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
end
