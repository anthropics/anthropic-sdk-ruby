# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The member is the user the API key or token belongs to.
        class BetaCannotSignOutSelfError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaCannotSignOutSelfErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
