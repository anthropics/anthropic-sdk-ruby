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
        #   @return [Symbol, :memory_store_archived_error]
        required :type, const: :memory_store_archived_error

        # @!method initialize(message:, type: :memory_store_archived_error)
        #   A memory store referenced by the deployment is archived.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :memory_store_archived_error]
      end
    end

    BetaManagedAgentsMemoryStoreArchivedRunError = Beta::BetaManagedAgentsMemoryStoreArchivedRunError
  end
end
