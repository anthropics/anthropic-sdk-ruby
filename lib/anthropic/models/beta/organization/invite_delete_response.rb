# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Invites#delete
        class InviteDeleteResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the Invite.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   Deleted object type.
          #
          #   For Invites, this is always `"invite_deleted"`.
          #
          #   @return [Symbol, :invite_deleted]
          required :type, const: :invite_deleted

          # @!method initialize(id:, type: :invite_deleted)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::InviteDeleteResponse} for more details.
          #
          #   @param id [String] ID of the Invite.
          #
          #   @param type [Symbol, :invite_deleted] Deleted object type.
        end
      end
    end
  end
end
