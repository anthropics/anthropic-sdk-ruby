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
          #
          #   @return [String]
          required :user_id, String

          # @!method initialize(type:, user_id:)
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor::Type]
          #   @param user_id [String]

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
