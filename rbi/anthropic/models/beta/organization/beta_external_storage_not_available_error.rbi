# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # External Storage isn't available for this Workspace, so only `internal` storage
        # is accepted. The error's `message` says why.
        class BetaExternalStorageNotAvailableError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaExternalStorageNotAvailableErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
