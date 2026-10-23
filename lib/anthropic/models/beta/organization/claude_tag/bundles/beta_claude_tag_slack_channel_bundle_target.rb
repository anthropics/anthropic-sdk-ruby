# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            class BetaClaudeTagSlackChannelBundleTarget < Anthropic::Internal::Type::BaseModel
              # @!attribute id
              #   The Bundle Target's identifier. Starts with `btgt_`. No two Bundle Targets have
              #   the same one, and the same Bundle and target always give the same one, also
              #   after a detach and a new attach. It is opaque.
              #
              #   @return [String]
              required :id, String

              # @!attribute created_at
              #   Time the Bundle was attached.
              #
              #   @return [Time]
              required :created_at, Time

              # @!attribute slack_channel_id
              #   The identifier of the Slack channel the Bundle is attached to, starting with
              #   `slch_`. It is the channel object's `id`, not Slack's `channel_id`.
              #
              #   @return [String]
              required :slack_channel_id, String

              # @!attribute type
              #
              #   @return [Symbol, :slack_channel]
              required :type, const: :slack_channel

              # @!method initialize(id:, created_at:, slack_channel_id:, type: :slack_channel)
              #   One Bundle attached to one Slack channel. The Bundle can be used in that channel
              #   only.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget}
              #   for more details.
              #
              #   @param id [String] The Bundle Target's identifier. Starts with `btgt_`. No two Bundle Targets have
              #
              #   @param created_at [Time] Time the Bundle was attached.
              #
              #   @param slack_channel_id [String] The identifier of the Slack channel the Bundle is attached to, starting with `sl
              #
              #   @param type [Symbol, :slack_channel]
            end
          end
        end
      end
    end
  end
end
