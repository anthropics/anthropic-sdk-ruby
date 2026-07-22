# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookMemoryStoreCreatedEventData < Anthropic::Internal::Type::BaseModel
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
        #   @return [Symbol, :"memory_store.created"]
        required :type, const: :"memory_store.created"

        # @!attribute workspace_id
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(id:, organization_id:, workspace_id:, type: :"memory_store.created")
        #   @param id [String] ID of the memory store that triggered the event.
        #
        #   @param organization_id [String]
        #
        #   @param workspace_id [String]
        #
        #   @param type [Symbol, :"memory_store.created"]
      end
    end

    BetaWebhookMemoryStoreCreatedEventData = Beta::BetaWebhookMemoryStoreCreatedEventData
  end
end
