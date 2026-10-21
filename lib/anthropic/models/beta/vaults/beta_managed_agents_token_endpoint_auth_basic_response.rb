# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthBasicResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :client_secret_basic]
          required :type, const: :client_secret_basic

          # @!method initialize(type: :client_secret_basic)
          #   Token endpoint uses HTTP Basic authentication with client credentials.
          #
          #   @param type [Symbol, :client_secret_basic]
        end
      end
    end
  end
end
