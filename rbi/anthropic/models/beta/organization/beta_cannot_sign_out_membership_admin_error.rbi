# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The member is a membership admin, and the person the API key or token belongs to
        # is not allowed to sign out membership admins.
        class BetaCannotSignOutMembershipAdminError < Anthropic::Errors::PermissionDeniedError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaCannotSignOutMembershipAdminErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
