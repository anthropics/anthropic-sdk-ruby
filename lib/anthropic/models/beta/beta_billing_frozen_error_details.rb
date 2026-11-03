# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBillingFrozenErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :billing_frozen]
        required :error_code, const: :billing_frozen

        # @!method initialize(error_code: :billing_frozen)
        #   Anthropic has temporarily disabled billing changes for the user account the
        #   credential belongs to. Contact support.
        #
        #   @param error_code [Symbol, :billing_frozen]
      end
    end

    BetaBillingFrozenErrorDetails = Beta::BetaBillingFrozenErrorDetails
  end
end
