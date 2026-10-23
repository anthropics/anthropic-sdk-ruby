# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackChannelSettingSource < Anthropic::Internal::Type::BaseModel
          # @!attribute slack_channel_id
          #   The channel's identifier, starting with `slch_`.
          #
          #   @return [String]
          required :slack_channel_id, String

          # @!attribute type
          #
          #   @return [Symbol, :slack_channel]
          required :type, const: :slack_channel

          # @!method initialize(slack_channel_id:, type: :slack_channel)
          #   The value comes from the addressed Slack channel itself.
          #
          #   @param slack_channel_id [String] The channel's identifier, starting with `slch_`.
          #
          #   @param type [Symbol, :slack_channel]
        end
      end
    end
  end
end
