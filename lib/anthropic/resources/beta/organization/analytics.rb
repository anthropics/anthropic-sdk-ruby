# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Analytics
          # @return [Anthropic::Resources::Beta::Organization::Analytics::Summaries]
          attr_reader :summaries

          # @return [Anthropic::Resources::Beta::Organization::Analytics::Users]
          attr_reader :users

          # @return [Anthropic::Resources::Beta::Organization::Analytics::Apps]
          attr_reader :apps

          # @return [Anthropic::Resources::Beta::Organization::Analytics::Connectors]
          attr_reader :connectors

          # @return [Anthropic::Resources::Beta::Organization::Analytics::Plugins]
          attr_reader :plugins

          # @return [Anthropic::Resources::Beta::Organization::Analytics::Skills]
          attr_reader :skills

          # @return [Anthropic::Resources::Beta::Organization::Analytics::Artifacts]
          attr_reader :artifacts

          # @return [Anthropic::Resources::Beta::Organization::Analytics::UsageReport]
          attr_reader :usage_report

          # @return [Anthropic::Resources::Beta::Organization::Analytics::CostReport]
          attr_reader :cost_report

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @summaries = Anthropic::Resources::Beta::Organization::Analytics::Summaries.new(client: client)
            @users = Anthropic::Resources::Beta::Organization::Analytics::Users.new(client: client)
            @apps = Anthropic::Resources::Beta::Organization::Analytics::Apps.new(client: client)
            @connectors = Anthropic::Resources::Beta::Organization::Analytics::Connectors.new(client: client)
            @plugins = Anthropic::Resources::Beta::Organization::Analytics::Plugins.new(client: client)
            @skills = Anthropic::Resources::Beta::Organization::Analytics::Skills.new(client: client)
            @artifacts = Anthropic::Resources::Beta::Organization::Analytics::Artifacts.new(client: client)
            @usage_report = Anthropic::Resources::Beta::Organization::Analytics::UsageReport.new(client: client)
            @cost_report = Anthropic::Resources::Beta::Organization::Analytics::CostReport.new(client: client)
          end
        end
      end
    end
  end
end
