# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMCPToolConfigParams < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the MCP tool to configure. 1-128 characters.
        #
        #   @return [String]
        required :name, String

        # @!attribute enabled
        #   Whether this tool is enabled. Overrides the `default_config` setting.
        #
        #   @return [Boolean, nil]
        optional :enabled, Anthropic::Internal::Type::Boolean, nil?: true

        # @!attribute permission_policy
        #   Permission policy for tool execution.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, nil]
        optional :permission_policy,
                 union: -> { Anthropic::Beta::BetaManagedAgentsMCPToolConfigParams::PermissionPolicy },
                 nil?: true

        # @!method initialize(name:, enabled: nil, permission_policy: nil)
        #   Configuration override for a specific MCP tool.
        #
        #   @param name [String] Name of the MCP tool to configure. 1-128 characters.
        #
        #   @param enabled [Boolean, nil] Whether this tool is enabled. Overrides the `default_config` setting.
        #
        #   @param permission_policy [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, nil] Permission policy for tool execution.

        # Permission policy for tool execution.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsMCPToolConfigParams#permission_policy
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

    BetaManagedAgentsMCPToolConfigParams = Beta::BetaManagedAgentsMCPToolConfigParams
  end
end
