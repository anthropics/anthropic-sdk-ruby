# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMCPToolsetDefaultConfigParams < Anthropic::Internal::Type::BaseModel
        # @!attribute enabled
        #   Whether tools are enabled by default. Defaults to true if not specified.
        #
        #   @return [Boolean, nil]
        optional :enabled, Anthropic::Internal::Type::Boolean, nil?: true

        # @!attribute permission_policy
        #   Permission policy for tool execution.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, nil]
        optional :permission_policy,
                 union: -> {
                   Anthropic::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams::PermissionPolicy
                 },
                 nil?: true

        # @!method initialize(enabled: nil, permission_policy: nil)
        #   Default configuration for all tools from an MCP server.
        #
        #   @param enabled [Boolean, nil] Whether tools are enabled by default. Defaults to true if not specified.
        #
        #   @param permission_policy [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, nil] Permission policy for tool execution.

        # Permission policy for tool execution.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams#permission_policy
        module PermissionPolicy
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Tool calls are automatically approved without user confirmation.
          variant :always_allow, -> { Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy }

          # Tool calls require user confirmation before execution.
          variant :always_ask, -> { Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy)]
        end
      end
    end

    BetaManagedAgentsMCPToolsetDefaultConfigParams = Beta::BetaManagedAgentsMCPToolsetDefaultConfigParams
  end
end
