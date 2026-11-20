# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The Workspace has reached its limit of 100 different External Storage resources
        # attached over its lifetime. Detached storage counts toward the limit until it is
        # deleted.
        class BetaStorageAttachLimitReachedError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaStorageAttachLimitReachedErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
