# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSlackChannelSetUpSettingsRefusedErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #   A stable code that names the cause.
          #
          #   @return [Symbol, :slack_channel_set_up_settings_refused]
          required :error_code, const: :slack_channel_set_up_settings_refused

          # @!attribute slack_channel_id
          #   The identifier of the channel the request set up, starting with `slch_`.
          #
          #   @return [String]
          required :slack_channel_id, String

          # @!method initialize(slack_channel_id:, error_code: :slack_channel_set_up_settings_refused)
          #   The request set the channel up, and `settings` was then refused. The channel
          #   stays set up with every setting unset.
          #
          #   @param slack_channel_id [String] The identifier of the channel the request set up, starting with `slch_`.
          #
          #   @param error_code [Symbol, :slack_channel_set_up_settings_refused] A stable code that names the cause.
        end
      end
    end
  end
end
