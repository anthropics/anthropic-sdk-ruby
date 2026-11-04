# typed: strong

module Anthropic
  module Models
    module Beta
      # Anthropic has temporarily disabled billing changes for the user account the
      # credential belongs to. Contact support.
      class BetaBillingFrozenError < Anthropic::Errors::PermissionDeniedError
        sig { returns(Symbol) }
        def error_code
        end

        sig { returns(Anthropic::Beta::BetaBillingFrozenErrorDetails) }
        def details
        end
      end
    end
  end
end
