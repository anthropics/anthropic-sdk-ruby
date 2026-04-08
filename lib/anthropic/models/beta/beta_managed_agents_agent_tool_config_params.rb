# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentToolConfigParams < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Built-in agent tool identifier.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfigParams::Name]
        required :name, enum: -> { Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::Name }

        # @!attribute enabled
        #   Whether this tool is enabled and available to Claude. Overrides the
        #   default_config setting.
        #
        #   @return [Boolean, nil]
        optional :enabled, Anthropic::Internal::Type::Boolean, nil?: true

        # @!attribute permission_policy
        #   Permission policy for tool execution.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, nil]
        optional :permission_policy,
                 union: -> { Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams::PermissionPolicy },
                 nil?: true

        # @!method initialize(name:, enabled: nil, permission_policy: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfigParams} for more
        #   details.
        #
        #   Configuration override for a specific tool within a toolset.
        #
        #   @param name [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfigParams::Name] Built-in agent tool identifier.
        #
        #   @param enabled [Boolean, nil] Whether this tool is enabled and available to Claude. Overrides the default_conf
        #
        #   @param permission_policy [Anthropic::Models::Beta::BetaManagedAgentsAlwaysAllowPolicy, Anthropic::Models::Beta::BetaManagedAgentsAlwaysAskPolicy, nil] Permission policy for tool execution.

        # Built-in agent tool identifier.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfigParams#name
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
        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfigParams#permission_policy
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

    BetaManagedAgentsAgentToolConfigParams = Beta::BetaManagedAgentsAgentToolConfigParams
  end
end
