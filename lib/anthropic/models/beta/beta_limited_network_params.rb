# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaLimitedNetworkParams < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #   Network policy type
        #
        #   @return [Symbol, :limited]
        required :type, const: :limited

        # @!attribute allow_mcp_servers
        #   Permits outbound access to MCP server endpoints configured on the agent, beyond
        #   those listed in the `allowed_hosts` array. Defaults to `false`.
        #
        #   @return [Boolean, nil]
        optional :allow_mcp_servers, Anthropic::Internal::Type::Boolean, nil?: true

        # @!attribute allow_package_managers
        #   Permits outbound access to public package registries (PyPI, npm, etc.) beyond
        #   those listed in the `allowed_hosts` array. Defaults to `false`.
        #
        #   @return [Boolean, nil]
        optional :allow_package_managers, Anthropic::Internal::Type::Boolean, nil?: true

        # @!attribute allowed_hosts
        #   Specifies domains the container can reach.
        #
        #   @return [Array<String>, nil]
        optional :allowed_hosts, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!method initialize(allow_mcp_servers: nil, allow_package_managers: nil, allowed_hosts: nil, type: :limited)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaLimitedNetworkParams} for more details.
        #
        #   Limited network request params.
        #
        #   Fields default to null; on update, omitted fields preserve the existing value.
        #
        #   @param allow_mcp_servers [Boolean, nil] Permits outbound access to MCP server endpoints configured on the agent, beyond
        #
        #   @param allow_package_managers [Boolean, nil] Permits outbound access to public package registries (PyPI, npm, etc.) beyond th
        #
        #   @param allowed_hosts [Array<String>, nil] Specifies domains the container can reach.
        #
        #   @param type [Symbol, :limited] Network policy type
      end
    end

    BetaLimitedNetworkParams = Beta::BetaLimitedNetworkParams
  end
end
