# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      # @return [Anthropic::Resources::Beta::PromptCaching]
      attr_reader :prompt_caching

      def initialize(client:)
        @client = client
        @prompt_caching = Anthropic::Resources::Beta::PromptCaching.new(client: client)
      end
    end
  end
end
