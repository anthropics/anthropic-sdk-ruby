# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeTag
          # @return [Anthropic::Resources::Beta::Organization::ClaudeTag::SlackChannels]
          attr_reader :slack_channels

          # @return [Anthropic::Resources::Beta::Organization::ClaudeTag::SlackWorkspaces]
          attr_reader :slack_workspaces

          # @return [Anthropic::Resources::Beta::Organization::ClaudeTag::Bundles]
          attr_reader :bundles

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @slack_channels = Anthropic::Resources::Beta::Organization::ClaudeTag::SlackChannels.new(client: client)
            @slack_workspaces =
              Anthropic::Resources::Beta::Organization::ClaudeTag::SlackWorkspaces.new(client: client)
            @bundles = Anthropic::Resources::Beta::Organization::ClaudeTag::Bundles.new(client: client)
          end
        end
      end
    end
  end
end
