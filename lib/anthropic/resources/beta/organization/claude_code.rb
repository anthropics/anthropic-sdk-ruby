# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class ClaudeCode
          # @return [Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings]
          attr_reader :managed_settings

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @managed_settings =
              Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings.new(client: client)
          end
        end
      end
    end
  end
end
