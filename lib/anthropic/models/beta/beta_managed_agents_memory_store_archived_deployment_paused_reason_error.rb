# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   A memory store referenced by the deployment is archived.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          MEMORY_STORE_ARCHIVED_ERROR = :memory_store_archived_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError
  end
end
