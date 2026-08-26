# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Users#remove
        class UserRemoveResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the User.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   Deleted object type.
          #
          #   For Users, this is always `"user_deleted"`.
          #
          #   @return [Symbol, :user_deleted]
          required :type, const: :user_deleted

          # @!method initialize(id:, type: :user_deleted)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::UserRemoveResponse} for more details.
          #
          #   @param id [String] ID of the User.
          #
          #   @param type [Symbol, :user_deleted] Deleted object type.
        end
      end
    end
  end
end
