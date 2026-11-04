# typed: strong

module Anthropic
  module Models
    module Beta
      # Anthropic has turned off creating environments for this organization. Existing
      # environments still work.
      class BetaEnvironmentCreateDisabledError < Anthropic::Errors::PermissionDeniedError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(Anthropic::Beta::BetaEnvironmentCreateDisabledErrorDetails)
        end
        def details
        end
      end
    end
  end
end
