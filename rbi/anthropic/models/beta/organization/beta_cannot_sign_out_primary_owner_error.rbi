# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The member is the organization's primary owner, whom no API key or token can
        # sign out.
        class BetaCannotSignOutPrimaryOwnerError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaCannotSignOutPrimaryOwnerErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
