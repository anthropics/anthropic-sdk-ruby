# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Whether the agent can spawn session threads.
      module BetaManagedAgentsMultiagentSubagentsParams
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The agent can spawn session threads. Each thread runs a predefined agent, which is a saved agent in `predefined_agents`, or an inline agent, which the agent defines when it spawns the thread and which is not saved. If `inline_agents` is disabled, `predefined_agents` must name at least one agent.
        variant :enabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams }

        # The agent cannot spawn session threads.
        variant :disabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabledParams }

        module Type
          extend Anthropic::Internal::Type::Enum

          ENABLED = :enabled
          DISABLED = :disabled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabledParams)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsParams} for more
        # details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsParams::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams, nil] :inline_agents Whether the agent can define inline agents when it spawns session threads. Defau
        #
        #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSelfParams, String>, nil] :predefined_agents Predefined agents that this agent can spawn as session threads. At most 20. Defa
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabledParams]
        def self.new(type:, **args)
          case type.to_sym
          when :enabled
            Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsEnabledParams.new(**args)
          when :disabled
            Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabledParams.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsMultiagentSubagentsParams = Beta::BetaManagedAgentsMultiagentSubagentsParams
  end
end
