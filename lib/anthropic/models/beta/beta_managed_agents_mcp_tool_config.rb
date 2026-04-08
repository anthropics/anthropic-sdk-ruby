# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsMCPToolConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute enabled
        #
        #   @return [Boolean]
        required :enabled, Anthropic::Internal::Type::Boolean

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute permission_policy
        #   Permission policy for tool execution.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy]
        required :permission_policy,
                 union: -> { Anthropic::Beta::BetaManagedAgentsMCPToolConfig::PermissionPolicy }

        # @!method initialize(enabled:, name:, permission_policy:)
        #   Resolved configuration for a specific MCP tool.
        #
        #   @param enabled [Boolean]
        #
        #   @param name [String]
        #
        #   @param permission_policy [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy] Permission policy for tool execution.

        # Permission policy for tool execution.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsMCPToolConfig#permission_policy
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

    BetaManagedAgentsMCPToolConfig = Beta::BetaManagedAgentsMCPToolConfig
  end
end
