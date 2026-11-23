# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebhookExternalStorageFailedEventData < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID (`estrg_...`) of the External Storage whose bucket failed Anthropic's check
        #   or passes it again.
        #
        #   @return [String]
        required :id, String

        # @!attribute organization_id
        #
        #   @return [String]
        required :organization_id, String

        # @!attribute type
        #
        #   @return [Symbol, :"external_storage.failed"]
        required :type, const: :"external_storage.failed"

        # @!method initialize(id:, organization_id:, type: :"external_storage.failed")
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaWebhookExternalStorageFailedEventData} for more
        #   details.
        #
        #   @param id [String] ID (`estrg_...`) of the External Storage whose bucket failed Anthropic's check o
        #
        #   @param organization_id [String]
        #
        #   @param type [Symbol, :"external_storage.failed"]
      end
    end

    BetaWebhookExternalStorageFailedEventData = Beta::BetaWebhookExternalStorageFailedEventData
  end
end
