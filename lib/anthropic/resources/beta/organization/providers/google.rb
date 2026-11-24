# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Providers
          class Google
            # @return [Anthropic::Resources::Beta::Organization::Providers::Google::Projects]
            attr_reader :projects

            # @api private
            #
            # @param client [Anthropic::Client]
            def initialize(client:)
              @client = client
              @projects = Anthropic::Resources::Beta::Organization::Providers::Google::Projects.new(client: client)
            end
          end
        end
      end
    end
  end
end
