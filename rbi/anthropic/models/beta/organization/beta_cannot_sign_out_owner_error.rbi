# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The member is an owner or has owner permissions, and this API key or token
        # cannot sign them out. In a Claude Enterprise organization, an API key with the
        # `write:members` scope can.
        class BetaCannotSignOutOwnerError < Anthropic::Errors::PermissionDeniedError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaCannotSignOutOwnerErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
