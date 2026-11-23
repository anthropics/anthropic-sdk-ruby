# typed: strong

module Anthropic
  module Models
    module Beta
      # One of the organization's approvals from Anthropic could not be read right now,
      # so nothing was done. Retry after the `Retry-After` delay.
      class BetaAuthorizationCheckUnavailableError < Anthropic::Errors::ServiceUnavailableError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(
            Anthropic::Beta::BetaAuthorizationCheckUnavailableErrorDetails
          )
        end
        def details
        end
      end
    end
  end
end
