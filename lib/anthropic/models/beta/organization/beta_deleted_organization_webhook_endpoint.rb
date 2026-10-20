# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Webhooks#delete
        class BetaDeletedOrganizationWebhookEndpoint < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the deleted webhook endpoint.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   Always `webhook_endpoint_deleted`.
          #
          #   @return [Symbol, :webhook_endpoint_deleted]
          required :type, const: :webhook_endpoint_deleted

          # @!method initialize(id:, type: :webhook_endpoint_deleted)
          #   A deleted organization webhook endpoint.
          #
          #   @param id [String] ID of the deleted webhook endpoint.
          #
          #   @param type [Symbol, :webhook_endpoint_deleted] Always `webhook_endpoint_deleted`.
        end
      end
    end
  end
end
