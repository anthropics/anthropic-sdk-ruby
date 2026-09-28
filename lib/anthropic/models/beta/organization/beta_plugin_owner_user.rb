# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginOwnerUser < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   The Plugin lives in one member's personal plugin marketplace.
          #
          #   @return [Symbol, :user]
          required :type, const: :user

          # @!attribute user_id
          #   The member's User ID.
          #
          #   @return [String]
          required :user_id, String

          # @!method initialize(user_id:, type: :user)
          #   @param user_id [String] The member's User ID.
          #
          #   @param type [Symbol, :user] The Plugin lives in one member's personal plugin marketplace.
        end
      end
    end
  end
end
