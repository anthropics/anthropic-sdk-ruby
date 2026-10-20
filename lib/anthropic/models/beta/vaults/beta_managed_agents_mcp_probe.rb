# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPProbe < Anthropic::Internal::Type::BaseModel
          # @!attribute http_response
          #   The HTTP error response from the MCP server, or `null` if the MCP server didn't
          #   return one for the failing step, for example after a timeout or a DNS or TLS
          #   failure.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse, nil]
          required :http_response,
                   -> {
                     Anthropic::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse
                   },
                   nil?: true

          # @!attribute method_
          #   The MCP method that failed (for example `initialize` or `tools/list`).
          #
          #   @return [String]
          required :method_, String, api_name: :method

          # @!method initialize(http_response:, method_:)
          #   The failing step of an MCP validation probe.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPProbe} for more details.
          #
          #   @param http_response [Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse, nil] The HTTP error response from the MCP server, or `null` if the MCP server didn't
          #
          #   @param method_ [String] The MCP method that failed (for example `initialize` or `tools/list`).
        end
      end
    end
  end
end
