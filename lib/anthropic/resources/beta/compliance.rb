# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Compliance
        # @return [Anthropic::Resources::Beta::Compliance::Review]
        attr_reader :review

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @review = Anthropic::Resources::Beta::Compliance::Review.new(client: client)
        end
      end
    end
  end
end
