# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # This External Storage can't be attached to the setting named in `field`. The
        # error's `message` says why.
        class BetaStorageNotAttachableError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaStorageNotAttachableErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
