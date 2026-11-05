# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # On a public-sector deployment, only an API key or token that belongs to a person
        # with owner permissions can sign out a member with the `managed` role.
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
