# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The organization cannot retrieve, set or delete spend limits with an Admin API
        # credential.
        class BetaSpendLimitsAdminAPIWritesNotEnabledError < Anthropic::Errors::PermissionDeniedError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaSpendLimitsAdminAPIWritesNotEnabledErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
