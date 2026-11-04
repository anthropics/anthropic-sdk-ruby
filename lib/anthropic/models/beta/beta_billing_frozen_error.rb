# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Anthropic has temporarily disabled billing changes for the user account the
      # credential belongs to. Contact support.
      class BetaBillingFrozenError < Anthropic::Errors::PermissionDeniedError
        # @!method error_code
        #   @return [Symbol, :billing_frozen]

        # @return [Anthropic::Models::Beta::BetaBillingFrozenErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Beta::BetaBillingFrozenErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
