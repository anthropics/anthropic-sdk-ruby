# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaLimitedNetwork < Anthropic::Internal::Type::BaseModel
        # @!attribute allow_mcp_servers
        #   Permits outbound access to MCP server endpoints configured on the agent, beyond
        #   those listed in the `allowed_hosts` array.
        #
        #   @return [Boolean]
        required :allow_mcp_servers, Anthropic::Internal::Type::Boolean

        # @!attribute allow_package_managers
        #   Permits outbound access to public package registries (PyPI, npm, etc.) beyond
        #   those listed in the `allowed_hosts` array.
        #
        #   @return [Boolean]
        required :allow_package_managers, Anthropic::Internal::Type::Boolean

        # @!attribute allowed_hosts
        #   Specifies domains the container can reach.
        #
        #   @return [Array<String>]
        required :allowed_hosts, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute type
        #   Network policy type
        #
        #   @return [Symbol, :limited]
        required :type, const: :limited

        # @!method initialize(allow_mcp_servers:, allow_package_managers:, allowed_hosts:, type: :limited)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaLimitedNetwork} for more details.
        #
        #   Limited network access.
        #
        #   @param allow_mcp_servers [Boolean] Permits outbound access to MCP server endpoints configured on the agent, beyond
        #
        #   @param allow_package_managers [Boolean] Permits outbound access to public package registries (PyPI, npm, etc.) beyond th
        #
        #   @param allowed_hosts [Array<String>] Specifies domains the container can reach.
        #
        #   @param type [Symbol, :limited] Network policy type
      end
    end

    BetaLimitedNetwork = Beta::BetaLimitedNetwork
  end
end
