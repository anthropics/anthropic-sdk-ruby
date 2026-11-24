# typed: strong

module Anthropic
  module Models
    # Another organization has data controls turned on for this Google Cloud project,
    # or turned them off recently. The message says how long to wait.
    class BetaGCPProjectControlledByAnotherOrganizationError < Anthropic::Errors::ConflictError
      sig { returns(Symbol) }
      def error_code
      end

      sig do
        returns(
          Anthropic::BetaGCPProjectControlledByAnotherOrganizationErrorDetails
        )
      end
      def details
      end
    end
  end
end
