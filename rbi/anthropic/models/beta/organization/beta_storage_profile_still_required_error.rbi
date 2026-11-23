# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # This storage is bound to a different user profile from storage the Workspace has
        # attached, or from active or draining storage it once had for safeguards data.
        # Detaching storage the Workspace uses only for transcripts clears this. Detaching
        # safeguards storage doesn't, so use a new Workspace instead.
        class BetaStorageProfileStillRequiredError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaStorageProfileStillRequiredErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
