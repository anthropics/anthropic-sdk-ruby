# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsAPIActor < Anthropic::Internal::Type::BaseModel
          # @!attribute api_key_id
          #
          #   @return [String]
          required :api_key_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type }

          # @!method initialize(api_key_id:, type:)
          #   @param api_key_id [String]
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type]

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor#type
          module Type
            extend Anthropic::Internal::Type::Enum

            API_ACTOR = :api_actor

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
