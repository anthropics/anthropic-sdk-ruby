# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          # @see Anthropic::Resources::Beta::Organization::ClaudeTag::SlackChannels#create
          class BetaClaudeTagSlackChannel < Anthropic::Internal::Type::BaseModel
            # @!attribute id
            #   The channel's identifier. Starts with `slch_`. It does not change for as long as
            #   the channel is set up, with one exception: a channel that is not configured gets
            #   a new one when claude.ai replaces its record, which happens only while the
            #   organization's read-only mode is off. A channel that is removed and set up again
            #   also has a new one. The old one keeps returning 404; look the channel up by its
            #   Slack identifiers for the new one.
            #
            #   @return [String]
            required :id, String

            # @!attribute created_at
            #   Time the channel was set up, by whichever route. It does not change for as long
            #   as `id` does not.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute settings
            #   What the channel itself stores or, with `include_inherited`, what applies in it.
            #   `sources` says which.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSettings]
            required :settings, -> { Anthropic::Beta::Organization::BetaClaudeTagSettings }

            # @!attribute slack
            #   Slack's own identifiers for the channel.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers]
            required :slack, -> { Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers }

            # @!attribute sources
            #   For each setting, the settings level its value in `settings` comes from.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSettingSources]
            required :sources, -> { Anthropic::Beta::Organization::BetaClaudeTagSettingSources }

            # @!attribute type
            #
            #   @return [Symbol, :slack_channel]
            required :type, const: :slack_channel

            # @!attribute updated_at
            #   Time Claude Tag's record of the channel last changed. It moves on every change
            #   to a setting, and can also move when something no response holds changes, so a
            #   later value says to read the channel again, not that a setting changed.
            #   Attaching or detaching a Bundle does not by itself move it.
            #
            #   @return [Time]
            required :updated_at, Time

            # @!method initialize(id:, created_at:, settings:, slack:, sources:, updated_at:, type: :slack_channel)
            #   A Slack channel set up for Claude Tag, with the settings it stores or, with
            #   `include_inherited`, the settings that apply in it.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel}
            #   for more details.
            #
            #   @param id [String] The channel's identifier. Starts with `slch_`. It does not change for as long as
            #
            #   @param created_at [Time] Time the channel was set up, by whichever route. It does not change for as long
            #
            #   @param settings [Anthropic::Models::Beta::Organization::BetaClaudeTagSettings] What the channel itself stores or, with `include_inherited`, what applies in it.
            #
            #   @param slack [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers] Slack's own identifiers for the channel.
            #
            #   @param sources [Anthropic::Models::Beta::Organization::BetaClaudeTagSettingSources] For each setting, the settings level its value in `settings` comes from.
            #
            #   @param updated_at [Time] Time Claude Tag's record of the channel last changed. It moves on every change t
            #
            #   @param type [Symbol, :slack_channel]
          end
        end
      end
    end
  end
end
