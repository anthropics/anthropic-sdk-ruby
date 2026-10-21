# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :memory_store_archived_error]
        required :type, const: :memory_store_archived_error

        # @!method initialize(type: :memory_store_archived_error)
        #   A memory store referenced by the deployment is archived.
        #
        #   @param type [Symbol, :memory_store_archived_error]
      end
    end

    BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsMemoryStoreArchivedDeploymentPausedReasonError
  end
end
