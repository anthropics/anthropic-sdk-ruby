# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSlackChannelSetUpSettingsConflictErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #   A stable code that names the cause.
          #
          #   @return [Symbol, :slack_channel_set_up_settings_conflict]
          required :error_code, const: :slack_channel_set_up_settings_conflict

          # @!attribute slack_channel_id
          #   The identifier of the channel the request set up, starting with `slch_`.
          #
          #   @return [String]
          required :slack_channel_id, String

          # @!method initialize(slack_channel_id:, error_code: :slack_channel_set_up_settings_conflict)
          #   The request set the channel up, and something else then changed the channel or
          #   removed it. Nothing of `settings` was stored.
          #
          #   @param slack_channel_id [String] The identifier of the channel the request set up, starting with `slch_`.
          #
          #   @param error_code [Symbol, :slack_channel_set_up_settings_conflict] A stable code that names the cause.
        end
      end
    end
  end
end
