# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthPostResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :client_secret_post]
          required :type, const: :client_secret_post

          # @!method initialize(type: :client_secret_post)
          #   Token endpoint uses POST body authentication with client credentials.
          #
          #   @param type [Symbol, :client_secret_post]
        end
      end
    end
  end
end
