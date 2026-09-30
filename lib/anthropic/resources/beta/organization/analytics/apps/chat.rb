# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Analytics
          class Apps
            class Chat
              # @return [Anthropic::Resources::Beta::Organization::Analytics::Apps::Chat::Projects]
              attr_reader :projects

              # @api private
              #
              # @param client [Anthropic::Client]
              def initialize(client:)
                @client = client
                @projects = Anthropic::Resources::Beta::Organization::Analytics::Apps::Chat::Projects.new(client: client)
              end
            end
          end
        end
      end
    end
  end
end
