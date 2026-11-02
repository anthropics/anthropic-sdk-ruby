# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      class Analytics
        # @return [Anthropic::Resources::Organization::Analytics::Summaries]
        attr_reader :summaries

        # @return [Anthropic::Resources::Organization::Analytics::Users]
        attr_reader :users

        # @return [Anthropic::Resources::Organization::Analytics::Apps]
        attr_reader :apps

        # @return [Anthropic::Resources::Organization::Analytics::Connectors]
        attr_reader :connectors

        # @return [Anthropic::Resources::Organization::Analytics::Plugins]
        attr_reader :plugins

        # @return [Anthropic::Resources::Organization::Analytics::Skills]
        attr_reader :skills

        # @return [Anthropic::Resources::Organization::Analytics::Artifacts]
        attr_reader :artifacts

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @summaries = Anthropic::Resources::Organization::Analytics::Summaries.new(client: client)
          @users = Anthropic::Resources::Organization::Analytics::Users.new(client: client)
          @apps = Anthropic::Resources::Organization::Analytics::Apps.new(client: client)
          @connectors = Anthropic::Resources::Organization::Analytics::Connectors.new(client: client)
          @plugins = Anthropic::Resources::Organization::Analytics::Plugins.new(client: client)
          @skills = Anthropic::Resources::Organization::Analytics::Skills.new(client: client)
          @artifacts = Anthropic::Resources::Organization::Analytics::Artifacts.new(client: client)
        end
      end
    end
  end
end
