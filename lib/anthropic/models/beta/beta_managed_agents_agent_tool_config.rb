# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentToolConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute enabled
        #
        #   @return [Boolean]
        required :enabled, Anthropic::Internal::Type::Boolean

        # @!attribute name
        #   Built-in agent tool identifier.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfig::Name]
        required :name, enum: -> { Anthropic::Beta::BetaManagedAgentsAgentToolConfig::Name }

        # @!attribute permission_policy
        #   Permission policy for tool execution.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy]
        required :permission_policy,
                 union: -> { Anthropic::Beta::BetaManagedAgentsAgentToolConfig::PermissionPolicy }

        # @!method initialize(enabled:, name:, permission_policy:)
        #   Configuration for a specific agent tool.
        #
        #   @param enabled [Boolean]
        #
        #   @param name [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfig::Name] Built-in agent tool identifier.
        #
        #   @param permission_policy [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy] Permission policy for tool execution.

        # Built-in agent tool identifier.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfig#name
        module Name
          extend Anthropic::Internal::Type::Enum

          BASH = :bash
          EDIT = :edit
          READ = :read
          WRITE = :write
          GLOB = :glob
          GREP = :grep
          WEB_FETCH = :web_fetch
          WEB_SEARCH = :web_search

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Permission policy for tool execution.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfig#permission_policy
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

    BetaManagedAgentsAgentToolConfig = Beta::BetaManagedAgentsAgentToolConfig
  end
end
