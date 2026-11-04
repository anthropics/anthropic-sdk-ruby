# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The API key lacks the scope the request needs: `read:claude_tag` for a read,
        # `write:claude_tag` for a change.
        class BetaAPIKeyScopeMissingError < Anthropic::Errors::PermissionDeniedError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaAPIKeyScopeMissingErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
