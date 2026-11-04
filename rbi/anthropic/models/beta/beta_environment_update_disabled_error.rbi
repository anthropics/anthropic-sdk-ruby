# typed: strong

module Anthropic
  module Models
    module Beta
      # Anthropic has turned off updating environments for this organization. Existing
      # environments still work as they are.
      class BetaEnvironmentUpdateDisabledError < Anthropic::Errors::PermissionDeniedError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(Anthropic::Beta::BetaEnvironmentUpdateDisabledErrorDetails)
        end
        def details
        end
      end
    end
  end
end
