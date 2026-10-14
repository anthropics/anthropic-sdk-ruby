# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsServiceAccountExecutionIdentity < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :service_account]
        required :type, const: :service_account

        # @!method initialize(type: :service_account)
        #   The Anthropic-managed service account as returned in API responses.
        #
        #   @param type [Symbol, :service_account]
      end
    end

    BetaManagedAgentsServiceAccountExecutionIdentity = Beta::BetaManagedAgentsServiceAccountExecutionIdentity
  end
end
