# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::UserProfiles#delete
    class DeletedUserProfile < Anthropic::Internal::Type::BaseModel
      # @!attribute id
      #   Identifier of the deleted user profile, prefixed `uprof_`.
      #
      #   @return [String]
      required :id, String

      # @!attribute type
      #   Object type. Always `user_profile_deleted`.
      #
      #   @return [Symbol, :user_profile_deleted]
      required :type, const: :user_profile_deleted

      # @!method initialize(id:, type: :user_profile_deleted)
      #   @param id [String] Identifier of the deleted user profile, prefixed `uprof_`.
      #
      #   @param type [Symbol, :user_profile_deleted] Object type. Always `user_profile_deleted`.
    end
  end
end
