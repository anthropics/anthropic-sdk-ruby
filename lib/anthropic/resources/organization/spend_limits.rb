# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      class SpendLimits
        # @return [Anthropic::Resources::Organization::SpendLimits::Effective]
        attr_reader :effective

        # @return [Anthropic::Resources::Organization::SpendLimits::IncreaseRequests]
        attr_reader :increase_requests

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @effective = Anthropic::Resources::Organization::SpendLimits::Effective.new(client: client)
          @increase_requests =
            Anthropic::Resources::Organization::SpendLimits::IncreaseRequests.new(client: client)
        end
      end
    end
  end
end
