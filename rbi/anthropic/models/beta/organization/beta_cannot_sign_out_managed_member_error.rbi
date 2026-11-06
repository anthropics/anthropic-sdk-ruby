# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The member has the `managed` role, and this API key or token cannot sign them
        # out. The error message says which keys and tokens can.
        class BetaCannotSignOutManagedMemberError < Anthropic::Errors::PermissionDeniedError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaCannotSignOutManagedMemberErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
