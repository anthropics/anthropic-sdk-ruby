# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeCode
          class ManagedSettings
            # @return [Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::Configuration]
            attr_reader :configuration

            # @return [Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroups]
            attr_reader :rbac_groups

            # @return [Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefault]
            attr_reader :rbac_group_default

            # @api private
            #
            # @param client [Anthropic::Client]
            def initialize(client:)
              @client = client
              @configuration =
                Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::Configuration.new(client: client)
              @rbac_groups =
                Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroups.new(client: client)
              @rbac_group_default =
                Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroupDefault.new(client: client)
            end
          end
        end
      end
    end
  end
end
