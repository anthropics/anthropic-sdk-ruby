# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The External Storage can't be deleted while an Enterprise Frontier Safeguards
        # workspace policy lists it as allowed storage.
        class BetaExternalStorageInWorkspacePolicyError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaExternalStorageInWorkspacePolicyErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
