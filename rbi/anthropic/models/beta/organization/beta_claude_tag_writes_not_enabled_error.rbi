# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # Changes through the Claude Tag API are not enabled for the organization.
        class BetaClaudeTagWritesNotEnabledError < Anthropic::Errors::PermissionDeniedError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaClaudeTagWritesNotEnabledErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
