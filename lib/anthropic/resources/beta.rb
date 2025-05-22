# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      # @return [Anthropic::Resources::Beta::Models]
      attr_reader :models

      # @return [Anthropic::Resources::Beta::Messages]
      attr_reader :messages

      # @return [Anthropic::Resources::Beta::Files]
      attr_reader :files

      # @api private
      #
      # @param client [Anthropic::Client]
      def initialize(client:)
        @client = client
        @models = Anthropic::Resources::Beta::Models.new(client: client)
        @messages = Anthropic::Resources::Beta::Messages.new(client: client)
        @files = Anthropic::Resources::Beta::Files.new(client: client)
      end
    end
  end
end
