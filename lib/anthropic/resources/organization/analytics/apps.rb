# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      class Analytics
        class Apps
          # @return [Anthropic::Resources::Organization::Analytics::Apps::Chat]
          attr_reader :chat

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @chat = Anthropic::Resources::Organization::Analytics::Apps::Chat.new(client: client)
          end
        end
      end
    end
  end
end
