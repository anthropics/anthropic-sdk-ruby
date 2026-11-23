# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The organization already has External Storage for this bucket that it has not
        # deleted. List the organization's External Storage to find it.
        class BetaStorageAlreadyRegisteredError < Anthropic::Errors::ConflictError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaStorageAlreadyRegisteredErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
