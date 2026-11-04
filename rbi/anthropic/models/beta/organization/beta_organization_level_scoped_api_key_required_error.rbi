# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The credential is not a scoped API key that is bound at the organization level.
        class BetaOrganizationLevelScopedAPIKeyRequiredError < Anthropic::Errors::PermissionDeniedError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaOrganizationLevelScopedAPIKeyRequiredErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
