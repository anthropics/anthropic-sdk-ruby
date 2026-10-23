# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsServiceAccountActor < Anthropic::Internal::Type::BaseModel
          # @!attribute service_account_id
          #   Tagged service account ID.
          #
          #   @return [String]
          required :service_account_id, String

          # @!attribute type
          #
          #   @return [Symbol, :service_account_actor]
          required :type, const: :service_account_actor

          # @!method initialize(service_account_id:, type: :service_account_actor)
          #   @param service_account_id [String] Tagged service account ID.
          #
          #   @param type [Symbol, :service_account_actor]
        end
      end
    end
  end
end
