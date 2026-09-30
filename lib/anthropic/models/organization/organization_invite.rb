# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # @see Anthropic::Resources::Organization::Invites#create
      class OrganizationInvite < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the Invite.
        #
        #   @return [String]
        required :id, String

        # @!attribute accepted_at
        #   RFC 3339 datetime string indicating when the Invite was accepted, or null.
        #
        #   @return [Time, nil]
        required :accepted_at, Time, nil?: true

        # @!attribute email
        #   Email of the User being invited.
        #
        #   @return [String]
        required :email, String

        # @!attribute expires_at
        #   RFC 3339 datetime string indicating when the Invite expires.
        #
        #   @return [Time]
        required :expires_at, Time

        # @!attribute invited_at
        #   RFC 3339 datetime string indicating when the Invite was created.
        #
        #   @return [Time]
        required :invited_at, Time

        # @!attribute rbac_group_ids
        #   RBAC group IDs recorded on the Invite (Claude Enterprise organizations), to be
        #   assigned to the User when the Invite is accepted. `[]` when none.
        #
        #   @return [Array<String>]
        required :rbac_group_ids, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute role
        #   Organization role of the User.
        #
        #   @return [Symbol, Anthropic::Models::OrganizationRole]
        required :role, enum: -> { Anthropic::OrganizationRole }

        # @!attribute status
        #   Status of the Invite.
        #
        #   @return [Symbol, Anthropic::Models::Organization::OrganizationInvite::Status]
        required :status, enum: -> { Anthropic::Organization::OrganizationInvite::Status }

        # @!attribute type
        #   Object type.
        #
        #   For Invites, this is always `"invite"`.
        #
        #   @return [Symbol, :invite]
        required :type, const: :invite

        # @!method initialize(id:, accepted_at:, email:, expires_at:, invited_at:, rbac_group_ids:, role:, status:, type: :invite)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::OrganizationInvite} for more details.
        #
        #   @param id [String] ID of the Invite.
        #
        #   @param accepted_at [Time, nil] RFC 3339 datetime string indicating when the Invite was accepted, or null.
        #
        #   @param email [String] Email of the User being invited.
        #
        #   @param expires_at [Time] RFC 3339 datetime string indicating when the Invite expires.
        #
        #   @param invited_at [Time] RFC 3339 datetime string indicating when the Invite was created.
        #
        #   @param rbac_group_ids [Array<String>] RBAC group IDs recorded on the Invite (Claude Enterprise organizations), to be a
        #
        #   @param role [Symbol, Anthropic::Models::OrganizationRole] Organization role of the User.
        #
        #   @param status [Symbol, Anthropic::Models::Organization::OrganizationInvite::Status] Status of the Invite.
        #
        #   @param type [Symbol, :invite] Object type.

        # Status of the Invite.
        #
        # @see Anthropic::Models::Organization::OrganizationInvite#status
        module Status
          extend Anthropic::Internal::Type::Enum

          ACCEPTED = :accepted
          DELETED = :deleted
          EXPIRED = :expired
          PENDING = :pending

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    OrganizationInvite = Organization::OrganizationInvite
  end
end
