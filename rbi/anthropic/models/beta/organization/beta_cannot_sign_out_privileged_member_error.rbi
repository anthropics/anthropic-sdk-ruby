# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # This OAuth token cannot sign out a membership admin or a member whose roles
        # grant owner, user management, or identity and access management.
        class BetaCannotSignOutPrivilegedMemberError < Anthropic::Errors::PermissionDeniedError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaCannotSignOutPrivilegedMemberErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
