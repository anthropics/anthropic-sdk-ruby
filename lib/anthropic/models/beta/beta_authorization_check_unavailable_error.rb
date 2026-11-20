# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # One of the organization's approvals from Anthropic could not be read right now,
      # so nothing was done. Retry after the `Retry-After` delay.
      class BetaAuthorizationCheckUnavailableError < Anthropic::Errors::ServiceUnavailableError
        # @!method error_code
        #   @return [Symbol, :authorization_check_unavailable]

        # @return [Anthropic::Models::Beta::BetaAuthorizationCheckUnavailableErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Beta::BetaAuthorizationCheckUnavailableErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
