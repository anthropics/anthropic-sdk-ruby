# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAPIKeyUserActor < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   Principal type. Always `"user_actor"` for a User.
          #
          #   @return [Symbol, :user_actor]
          required :type, const: :user_actor

          # @!attribute user_id
          #   ID of the User the API key acts as.
          #
          #   @return [String]
          required :user_id, String

          # @!method initialize(user_id:, type: :user_actor)
          #   @param user_id [String] ID of the User the API key acts as.
          #
          #   @param type [Symbol, :user_actor] Principal type. Always `"user_actor"` for a User.
        end
      end
    end
  end
end
