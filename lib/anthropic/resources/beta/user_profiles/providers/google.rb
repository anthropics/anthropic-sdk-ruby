# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class UserProfiles
        class Providers
          class Google
            # @return [Anthropic::Resources::Beta::UserProfiles::Providers::Google::DataControls]
            attr_reader :data_controls

            # @api private
            #
            # @param client [Anthropic::Client]
            def initialize(client:)
              @client = client
              @data_controls =
                Anthropic::Resources::Beta::UserProfiles::Providers::Google::DataControls.new(client: client)
            end
          end
        end
      end
    end
  end
end
