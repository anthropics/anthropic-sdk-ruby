# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsStaticBearerCreateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute token
          #   Static bearer token value.
          #
          #   @return [String]
          required :token, String

          # @!attribute mcp_server_url
          #   URL of the MCP server this credential authenticates against.
          #
          #   @return [String]
          required :mcp_server_url, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams::Type }

          # @!method initialize(token:, mcp_server_url:, type:)
          #   Parameters for creating a static bearer token credential.
          #
          #   @param token [String] Static bearer token value.
          #
          #   @param mcp_server_url [String] URL of the MCP server this credential authenticates against.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsStaticBearerCreateParams#type
          module Type
            extend Anthropic::Internal::Type::Enum

            STATIC_BEARER = :static_bearer

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
