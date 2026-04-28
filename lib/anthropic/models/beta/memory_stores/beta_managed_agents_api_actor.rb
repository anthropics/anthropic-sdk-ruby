# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsAPIActor < Anthropic::Internal::Type::BaseModel
          # @!attribute api_key_id
          #   ID of the API key that performed the write. This identifies the key, not the
          #   secret.
          #
          #   @return [String]
          required :api_key_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type }

          # @!method initialize(api_key_id:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor} for more
          #   details.
          #
          #   Attribution for a write made directly via the public API (outside of any
          #   session).
          #
          #   @param api_key_id [String] ID of the API key that performed the write. This identifies the key, not the sec
          #
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
