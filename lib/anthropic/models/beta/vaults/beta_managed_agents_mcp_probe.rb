# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPProbe < Anthropic::Internal::Type::BaseModel
          # @!attribute http_response
          #   An HTTP response captured during a credential validation probe.
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
          #   @param http_response [Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse, nil] An HTTP response captured during a credential validation probe.
          #
          #   @param method_ [String] The MCP method that failed (for example `initialize` or `tools/list`).
        end
      end
    end
  end
end
