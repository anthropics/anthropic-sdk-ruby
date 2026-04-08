# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAgentToolset20260401 < Anthropic::Internal::Type::BaseModel
        # @!attribute configs
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfig>]
        required :configs,
                 -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaManagedAgentsAgentToolConfig] }

        # @!attribute default_config
        #   Resolved default configuration for agent tools.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsAgentToolsetDefaultConfig]
        required :default_config, -> { Anthropic::Beta::BetaManagedAgentsAgentToolsetDefaultConfig }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsAgentToolset20260401::Type }

        # @!method initialize(configs:, default_config:, type:)
        #   @param configs [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentToolConfig>]
        #
        #   @param default_config [Anthropic::Models::Beta::BetaManagedAgentsAgentToolsetDefaultConfig] Resolved default configuration for agent tools.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsAgentToolset20260401#type
        module Type
          extend Anthropic::Internal::Type::Enum

          AGENT_TOOLSET_20260401 = :agent_toolset_20260401

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsAgentToolset20260401 = Beta::BetaManagedAgentsAgentToolset20260401
  end
end
