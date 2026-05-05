# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      # @return [Anthropic::Resources::Beta::Models]
      attr_reader :models

      # @return [Anthropic::Resources::Beta::Messages]
      attr_reader :messages

      # @return [Anthropic::Resources::Beta::Agents]
      attr_reader :agents

      # @return [Anthropic::Resources::Beta::Environments]
      attr_reader :environments

      # @return [Anthropic::Resources::Beta::Sessions]
      attr_reader :sessions

      # @return [Anthropic::Resources::Beta::Vaults]
      attr_reader :vaults

      # @return [Anthropic::Resources::Beta::MemoryStores]
      attr_reader :memory_stores

      # @return [Anthropic::Resources::Beta::Files]
      attr_reader :files

      # @return [Anthropic::Resources::Beta::Skills]
      attr_reader :skills

      # @return [Anthropic::Resources::Beta::Webhooks]
      attr_reader :webhooks

      # @return [Anthropic::Resources::Beta::UserProfiles]
      attr_reader :user_profiles

      # @api private
      #
      # @param client [Anthropic::Client]
      def initialize(client:)
        @client = client
        @models = Anthropic::Resources::Beta::Models.new(client: client)
        @messages = Anthropic::Resources::Beta::Messages.new(client: client)
        @agents = Anthropic::Resources::Beta::Agents.new(client: client)
        @environments = Anthropic::Resources::Beta::Environments.new(client: client)
        @sessions = Anthropic::Resources::Beta::Sessions.new(client: client)
        @vaults = Anthropic::Resources::Beta::Vaults.new(client: client)
        @memory_stores = Anthropic::Resources::Beta::MemoryStores.new(client: client)
        @files = Anthropic::Resources::Beta::Files.new(client: client)
        @skills = Anthropic::Resources::Beta::Skills.new(client: client)
        @webhooks = Anthropic::Resources::Beta::Webhooks.new(client: client)
        @user_profiles = Anthropic::Resources::Beta::UserProfiles.new(client: client)
      end
    end
  end
end
