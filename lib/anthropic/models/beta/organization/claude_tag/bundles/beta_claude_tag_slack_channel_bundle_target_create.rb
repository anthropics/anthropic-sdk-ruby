# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            class BetaClaudeTagSlackChannelBundleTargetCreate < Anthropic::Internal::Type::BaseModel
              # @!attribute slack_channel_id
              #   The identifier of the Slack channel to attach the Bundle to, starting with
              #   `slch_`. It is the channel object's `id`, not Slack's `channel_id`.
              #
              #   @return [String]
              required :slack_channel_id, String

              # @!attribute type
              #
              #   @return [Symbol, :slack_channel]
              required :type, const: :slack_channel

              # @!method initialize(slack_channel_id:, type: :slack_channel)
              #   Attach the Bundle to a Slack channel.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTargetCreate}
              #   for more details.
              #
              #   @param slack_channel_id [String] The identifier of the Slack channel to attach the Bundle to, starting with `slch
              #
              #   @param type [Symbol, :slack_channel]
            end
          end
        end
      end
    end
  end
end
