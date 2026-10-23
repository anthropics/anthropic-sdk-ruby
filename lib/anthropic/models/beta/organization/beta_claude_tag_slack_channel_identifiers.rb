# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackChannelIdentifiers < Anthropic::Internal::Type::BaseModel
          # @!attribute channel_id
          #   Slack's identifier for the channel, starting with `C` or `G`, such as
          #   `C0456EFGH`.
          #
          #   @return [String]
          required :channel_id, String

          # @!attribute workspace_id
          #   Slack's identifier for the workspace the channel is in, starting with `T`, such
          #   as `T0123ABCD`.
          #
          #   @return [String]
          required :workspace_id, String

          # @!method initialize(channel_id:, workspace_id:)
          #   The identifiers Slack shows for a channel. They are Slack's own, not identifiers
          #   of this API.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers}
          #   for more details.
          #
          #   @param channel_id [String] Slack's identifier for the channel, starting with `C` or `G`, such as `C0456EFGH
          #
          #   @param workspace_id [String] Slack's identifier for the workspace the channel is in, starting with `T`, such
        end
      end
    end
  end
end
