# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The organization's compliance configuration does not let Claude Tag store
        # anything new.
        class BetaComplianceConfigurationRestrictedError < Anthropic::Errors::PermissionDeniedError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaComplianceConfigurationRestrictedErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
