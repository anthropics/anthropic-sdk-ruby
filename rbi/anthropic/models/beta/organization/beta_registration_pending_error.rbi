# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The Plugin version was stored but is not yet usable in claude.ai. `plugin_id`
        # and `plugin_version_id` identify what was stored.
        class BetaRegistrationPendingError < Anthropic::Errors::ServiceUnavailableError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaRegistrationPendingErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
