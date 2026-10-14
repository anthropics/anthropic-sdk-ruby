# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsServiceAccountExecutionIdentityParams < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :service_account]
        required :type, const: :service_account

        # @!method initialize(type: :service_account)
        #   The Anthropic-managed service account — the default execution principal. Carries
        #   no identifier.
        #
        #   @param type [Symbol, :service_account]
      end
    end

    BetaManagedAgentsServiceAccountExecutionIdentityParams =
      Beta::BetaManagedAgentsServiceAccountExecutionIdentityParams
  end
end
