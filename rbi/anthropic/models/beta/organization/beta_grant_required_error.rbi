# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # Anthropic has not approved External Storage for the organization, for the
        # Workspace or, for storage bound to a user profile, for that user profile.
        # Contact your Anthropic account team.
        class BetaGrantRequiredError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaGrantRequiredErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
