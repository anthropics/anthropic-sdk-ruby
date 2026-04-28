# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsUserActor < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::Type }

          # @!attribute user_id
          #   ID of the user who performed the write (a `user_...` value).
          #
          #   @return [String]
          required :user_id, String

          # @!method initialize(type:, user_id:)
          #   Attribution for a write made by a human user through the Anthropic Console.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor::Type]
          #
          #   @param user_id [String] ID of the user who performed the write (a `user_...` value).

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor#type
          module Type
            extend Anthropic::Internal::Type::Enum

            USER_ACTOR = :user_actor

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
