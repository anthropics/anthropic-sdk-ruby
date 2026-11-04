# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The request set the channel up, and something else then changed the channel or
        # removed it. Nothing of `settings` was stored.
        class BetaSlackChannelSetUpSettingsConflictError < Anthropic::Errors::ConflictError
          # @!method error_code
          #   @return [Symbol, :slack_channel_set_up_settings_conflict]

          # @return [Anthropic::Models::Beta::Organization::BetaSlackChannelSetUpSettingsConflictErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaSlackChannelSetUpSettingsConflictErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
