# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackParentChannelSettingSource < Anthropic::Internal::Type::BaseModel
          # @!attribute slack_channel_id
          #   The parent channel's identifier, starting with `slch_`.
          #
          #   @return [String]
          required :slack_channel_id, String

          # @!attribute type
          #
          #   @return [Symbol, :slack_parent_channel]
          required :type, const: :slack_parent_channel

          # @!method initialize(slack_channel_id:, type: :slack_parent_channel)
          #   The value comes from the channel that a code channel was started from. A parent
          #   channel contributes `instructions` and `environment_id` only.
          #
          #   @param slack_channel_id [String] The parent channel's identifier, starting with `slch_`.
          #
          #   @param type [Symbol, :slack_parent_channel]
        end
      end
    end
  end
end
