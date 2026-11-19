# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The RBAC Group is not one of the organization's groups.
        class BetaRBACGroupNotFoundError < Anthropic::Errors::NotFoundError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaRBACGroupNotFoundErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
