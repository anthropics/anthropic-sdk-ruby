# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The External Storage failed verification, so the request changed nothing.
        # `failed_checks` lists what to fix.
        class BetaStorageVerificationFailedError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaStorageVerificationFailedErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
