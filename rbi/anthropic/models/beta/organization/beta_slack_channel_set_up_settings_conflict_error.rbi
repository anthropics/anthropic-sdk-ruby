# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The request set the channel up, and something else then changed the channel or
        # removed it. Nothing of `settings` was stored.
        class BetaSlackChannelSetUpSettingsConflictError < Anthropic::Errors::ConflictError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaSlackChannelSetUpSettingsConflictErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
