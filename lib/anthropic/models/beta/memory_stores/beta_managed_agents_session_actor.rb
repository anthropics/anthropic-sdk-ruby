# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsSessionActor < Anthropic::Internal::Type::BaseModel
          # @!attribute session_id
          #
          #   @return [String]
          required :session_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type }

          # @!method initialize(session_id:, type:)
          #   @param session_id [String]
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type]

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_ACTOR = :session_actor

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
