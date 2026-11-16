# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookExternalKeyFailedEventData < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID (`ekey_...`) of the external key that stopped working or works again.
        #
        #   @return [String]
        required :id, String

        # @!attribute organization_id
        #
        #   @return [String]
        required :organization_id, String

        # @!attribute type
        #
        #   @return [Symbol, :"external_key.failed"]
        required :type, const: :"external_key.failed"

        # @!method initialize(id:, organization_id:, type: :"external_key.failed")
        #   @param id [String] ID (`ekey_...`) of the external key that stopped working or works again.
        #
        #   @param organization_id [String]
        #
        #   @param type [Symbol, :"external_key.failed"]
      end
    end

    BetaWebhookExternalKeyFailedEventData = Beta::BetaWebhookExternalKeyFailedEventData
  end
end
