# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          # @see Anthropic::Resources::Beta::Organization::ClaudeTag::SlackChannels#delete
          class BetaClaudeTagDeletedSlackChannel < Anthropic::Internal::Type::BaseModel
            # @!attribute id
            #   The removed channel's identifier.
            #
            #   @return [String]
            required :id, String

            # @!attribute type
            #
            #   @return [Symbol, :slack_channel_deleted]
            required :type, const: :slack_channel_deleted

            # @!method initialize(id:, type: :slack_channel_deleted)
            #   Confirms that a Slack channel was removed from Claude Tag.
            #
            #   @param id [String] The removed channel's identifier.
            #
            #   @param type [Symbol, :slack_channel_deleted]
          end
        end
      end
    end
  end
end
