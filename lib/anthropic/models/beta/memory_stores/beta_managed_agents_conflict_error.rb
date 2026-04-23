# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsConflictError < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsConflictError::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsConflictError::Type }

          # @!attribute message
          #
          #   @return [String, nil]
          optional :message, String

          # @!method initialize(type:, message: nil)
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsConflictError::Type]
          #   @param message [String]

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsConflictError#type
          module Type
            extend Anthropic::Internal::Type::Enum

            CONFLICT_ERROR = :conflict_error

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
