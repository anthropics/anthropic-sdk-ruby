# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemoryPreconditionFailedError < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedError::Type]
          required :type,
                   enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedError::Type }

          # @!attribute message
          #
          #   @return [String, nil]
          optional :message, String

          # @!method initialize(type:, message: nil)
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedError::Type]
          #   @param message [String]

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPreconditionFailedError#type
          module Type
            extend Anthropic::Internal::Type::Enum

            MEMORY_PRECONDITION_FAILED_ERROR = :memory_precondition_failed_error

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
