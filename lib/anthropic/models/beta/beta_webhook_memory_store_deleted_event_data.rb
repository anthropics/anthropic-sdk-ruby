# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookMemoryStoreDeletedEventData < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the memory store that triggered the event.
        #
        #   @return [String]
        required :id, String

        # @!attribute organization_id
        #
        #   @return [String]
        required :organization_id, String

        # @!attribute type
        #
        #   @return [Symbol, :"memory_store.deleted"]
        required :type, const: :"memory_store.deleted"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"memory_store.deleted")
        #   @param id [String] ID of the memory store that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"memory_store.deleted"]
      end
    end

    BetaWebhookMemoryStoreDeletedEventData = Beta::BetaWebhookMemoryStoreDeletedEventData
  end
end
