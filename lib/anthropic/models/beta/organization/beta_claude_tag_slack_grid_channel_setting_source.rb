# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackGridChannelSettingSource < Anthropic::Internal::Type::BaseModel
          # @!attribute slack
          #   Slack's own identifiers for the channel under that other workspace.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers]
          required :slack, -> { Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers }

          # @!attribute type
          #
          #   @return [Symbol, :slack_grid_channel]
          required :type, const: :slack_grid_channel

          # @!method initialize(slack:, type: :slack_grid_channel)
          #   The value comes from the addressed channel as it is set up under another
          #   workspace of its Enterprise Grid: a channel shared across the Grid keeps one
          #   Slack channel identifier in every workspace that sees it.
          #
          #   @param slack [Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers] Slack's own identifiers for the channel under that other workspace.
          #
          #   @param type [Symbol, :slack_grid_channel]
        end
      end
    end
  end
end
