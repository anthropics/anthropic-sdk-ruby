# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaAuthorizationCheckUnavailableErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :authorization_check_unavailable]
        required :error_code, const: :authorization_check_unavailable

        # @!method initialize(error_code: :authorization_check_unavailable)
        #   One of the organization's approvals from Anthropic could not be read right now,
        #   so nothing was done. Retry after the `Retry-After` delay.
        #
        #   @param error_code [Symbol, :authorization_check_unavailable]
      end
    end

    BetaAuthorizationCheckUnavailableErrorDetails = Beta::BetaAuthorizationCheckUnavailableErrorDetails
  end
end
