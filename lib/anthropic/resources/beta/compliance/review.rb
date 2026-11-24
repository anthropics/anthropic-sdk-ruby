# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Compliance
        class Review
          # @return [Anthropic::Resources::Beta::Compliance::Review::Cases]
          attr_reader :cases

          # @return [Anthropic::Resources::Beta::Compliance::Review::Notices]
          attr_reader :notices

          # @return [Anthropic::Resources::Beta::Compliance::Review::Items]
          attr_reader :items

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @cases = Anthropic::Resources::Beta::Compliance::Review::Cases.new(client: client)
            @notices = Anthropic::Resources::Beta::Compliance::Review::Notices.new(client: client)
            @items = Anthropic::Resources::Beta::Compliance::Review::Items.new(client: client)
          end
        end
      end
    end
  end
end
