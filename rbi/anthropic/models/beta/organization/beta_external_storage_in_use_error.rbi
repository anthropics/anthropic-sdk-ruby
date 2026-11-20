# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The External Storage is `active` or `draining`, so this delete didn't erase it.
        # The message says what to do next. On `draining` storage this delete may have
        # started a removal that can't be undone: get the storage and read
        # `status.removal_started`.
        class BetaExternalStorageInUseError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaExternalStorageInUseErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
