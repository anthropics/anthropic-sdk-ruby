# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAPIKeyServiceAccountActor < Anthropic::Internal::Type::BaseModel
          # @!attribute service_account_id
          #   ID of the Service Account the API key acts as.
          #
          #   @return [String]
          required :service_account_id, String

          # @!attribute type
          #   Principal type. Always `"service_account_actor"` for a Service Account.
          #
          #   @return [Symbol, :service_account_actor]
          required :type, const: :service_account_actor

          # @!method initialize(service_account_id:, type: :service_account_actor)
          #   @param service_account_id [String] ID of the Service Account the API key acts as.
          #
          #   @param type [Symbol, :service_account_actor] Principal type. Always `"service_account_actor"` for a Service Account.
        end
      end
    end
  end
end
