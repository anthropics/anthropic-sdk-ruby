# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsUserActor < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :user_actor]
          required :type, const: :user_actor

          # @!attribute user_id
          #   ID of the user (a `user_...` value).
          #
          #   @return [String]
          required :user_id, String

          # @!method initialize(user_id:, type: :user_actor)
          #   A human user, for example acting through the Anthropic Console.
          #
          #   @param user_id [String] ID of the user (a `user_...` value).
          #
          #   @param type [Symbol, :user_actor]
        end
      end
    end
  end
end
