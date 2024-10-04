# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class PromptCaching
        # @return [Anthropic::Resources::Beta::PromptCaching::Messages]
        attr_reader :messages

        def initialize(client:)
          @client = client
          @messages = Anthropic::Resources::Beta::PromptCaching::Messages.new(client: client)
        end
      end
    end
  end
end
