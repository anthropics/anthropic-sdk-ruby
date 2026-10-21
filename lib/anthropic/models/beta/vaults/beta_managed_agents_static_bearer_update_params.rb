# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsStaticBearerUpdateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :static_bearer]
          required :type, const: :static_bearer

          # @!attribute token
          #   The new static bearer token to replace the stored one.
          #
          #   @return [String, nil]
          optional :token, String, nil?: true

          # @!method initialize(token: nil, type: :static_bearer)
          #   Parameters for updating a static bearer token credential. The `mcp_server_url`
          #   is immutable.
          #
          #   @param token [String, nil] The new static bearer token to replace the stored one.
          #
          #   @param type [Symbol, :static_bearer]
        end
      end
    end
  end
end
