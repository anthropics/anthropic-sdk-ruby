# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      class Federation
        # @return [Anthropic::Resources::Organization::Federation::Issuers]
        attr_reader :issuers

        # @return [Anthropic::Resources::Organization::Federation::Rules]
        attr_reader :rules

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @issuers = Anthropic::Resources::Organization::Federation::Issuers.new(client: client)
          @rules = Anthropic::Resources::Organization::Federation::Rules.new(client: client)
        end
      end
    end
  end
end
