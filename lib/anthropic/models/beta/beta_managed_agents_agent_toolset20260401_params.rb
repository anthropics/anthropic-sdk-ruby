# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentToolset20260401Params < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAgentToolset20260401Params::Type }

        # @!attribute configs
        #   Per-tool configuration overrides.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfigParams>, nil]
        optional :configs,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsAgentToolConfigParams] }

        # @!attribute default_config
        #   Default configuration for all tools in a toolset.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAgentToolsetDefaultConfigParams, nil]
        optional :default_config,
                 -> { Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfigParams },
                 nil?: true

        # @!method initialize(type:, configs: nil, default_config: nil)
        #   Configuration for built-in agent tools. Use this to enable or disable groups of
        #   tools available to the agent.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params::Type]
        #
        #   @param configs [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfigParams>] Per-tool configuration overrides.
        #
        #   @param default_config [Anthropic::Models::Beta::BetaManagedAgentsAgentToolsetDefaultConfigParams, nil] Default configuration for all tools in a toolset.

        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401Params#type
        module Type
          extend Anthropic::Internal::Type::Enum

          AGENT_TOOLSET_20260401 = :agent_toolset_20260401

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAgentToolset20260401Params = Beta::BetaManagedAgentsAgentToolset20260401Params
  end
end
