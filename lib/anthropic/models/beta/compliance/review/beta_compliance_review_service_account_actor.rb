# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewServiceAccountActor < Anthropic::Internal::Type::BaseModel
            # @!attribute service_account_id
            #   The ID of the service account (`svac_...`).
            #
            #   @return [String]
            required :service_account_id, String

            # @!attribute type
            #
            #   @return [Symbol, :service_account_actor]
            required :type, const: :service_account_actor

            # @!method initialize(service_account_id:, type: :service_account_actor)
            #   A service account.
            #
            #   @param service_account_id [String] The ID of the service account (`svac_...`).
            #
            #   @param type [Symbol, :service_account_actor]
          end
        end
      end
    end
  end
end
