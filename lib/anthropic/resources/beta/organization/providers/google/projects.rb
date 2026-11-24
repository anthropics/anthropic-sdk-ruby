# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Providers
          class Google
            class Projects
              # @return [Anthropic::Resources::Beta::Organization::Providers::Google::Projects::DataControls]
              attr_reader :data_controls

              # @api private
              #
              # @param client [Anthropic::Client]
              def initialize(client:)
                @client = client
                @data_controls =
                  Anthropic::Resources::Beta::Organization::Providers::Google::Projects::DataControls.new(client: client)
              end
            end
          end
        end
      end
    end
  end
end
