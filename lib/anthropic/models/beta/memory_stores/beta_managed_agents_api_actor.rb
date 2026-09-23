# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsAPIActor < Anthropic::Internal::Type::BaseModel
          # @!attribute api_key_id
          #   ID of the API key (an `apikey_...` value). This identifies the key, not the
          #   secret.
          #
          #   @return [String]
          required :api_key_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type }

          # @!method initialize(api_key_id:, type:)
          #   A direct caller of the public API, identified by the API key that authenticated
          #   the request.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor} for more
          #   details.
          #
          #   @param api_key_id [String] ID of the API key (an `apikey_...` value). This identifies the key, not the secr
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
