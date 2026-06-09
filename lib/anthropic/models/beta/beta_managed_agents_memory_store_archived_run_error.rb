# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMemoryStoreArchivedRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunError::Type }

        # @!method initialize(message:, type:)
        #   A memory store referenced by the deployment is archived.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MEMORY_STORE_ARCHIVED_ERROR = :memory_store_archived_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMemoryStoreArchivedRunError = Beta::BetaManagedAgentsMemoryStoreArchivedRunError
  end
end
