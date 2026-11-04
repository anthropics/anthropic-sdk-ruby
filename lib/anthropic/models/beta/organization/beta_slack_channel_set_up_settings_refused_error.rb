# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The request set the channel up, and `settings` was then refused. The channel
        # stays set up with every setting unset.
        class BetaSlackChannelSetUpSettingsRefusedError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :slack_channel_set_up_settings_refused]

          # @return [Anthropic::Models::Beta::Organization::BetaSlackChannelSetUpSettingsRefusedErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaSlackChannelSetUpSettingsRefusedErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
