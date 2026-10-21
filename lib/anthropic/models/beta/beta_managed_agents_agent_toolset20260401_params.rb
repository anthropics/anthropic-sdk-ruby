# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentToolset20260401Params < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :agent_toolset_20260401]
        required :type, const: :agent_toolset_20260401

        # @!attribute configs
        #   Per-tool configuration overrides.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsBashToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsEditToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsReadToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsWriteToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsGlobToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsGrepToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfigParams>, nil]
        optional :configs,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams] }

        # @!attribute default_config
        #   Default configuration applied to all tools in this set.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAgentToolsetDefaultConfigParams, nil]
        optional :default_config,
                 -> { Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfigParams },
                 nil?: true

        # @!method initialize(configs: nil, default_config: nil, type: :agent_toolset_20260401)
        #   Configuration for built-in agent tools. Use this to enable or disable groups of
        #   tools available to the agent.
        #
        #   @param configs [Array<Anthropic::Models::Beta::BetaManagedAgentsBashToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsEditToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsReadToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsWriteToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsGlobToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsGrepToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsWebFetchToolConfigParams, Anthropic::Models::Beta::BetaManagedAgentsWebSearchToolConfigParams>] Per-tool configuration overrides.
        #
        #   @param default_config [Anthropic::Models::Beta::BetaManagedAgentsAgentToolsetDefaultConfigParams, nil] Default configuration applied to all tools in this set.
        #
        #   @param type [Symbol, :agent_toolset_20260401]
      end
    end

    BetaManagedAgentsAgentToolset20260401Params = Beta::BetaManagedAgentsAgentToolset20260401Params
  end
end
