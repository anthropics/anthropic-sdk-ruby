# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class UserProfiles
        class Providers
          # @return [Anthropic::Resources::Beta::UserProfiles::Providers::Google]
          attr_reader :google

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @google = Anthropic::Resources::Beta::UserProfiles::Providers::Google.new(client: client)
          end
        end
      end
    end
  end
end
