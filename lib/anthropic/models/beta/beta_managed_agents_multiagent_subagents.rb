# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Whether the agent can spawn session threads.
      module BetaManagedAgentsMultiagentSubagents
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The agent can spawn session threads.
        variant :enabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsEnabled }

        # The agent cannot spawn session threads.
        variant :disabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabled }

        module Type
          extend Anthropic::Internal::Type::Enum

          ENABLED = :enabled
          DISABLED = :disabled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabled)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagents} for more
        # details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagents::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled] :inline_agents Whether the agent can define inline agents, which are not saved, when it spawns
        #
        #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsAgentReference>] :predefined_agents Predefined agents, which are saved agents that this agent can spawn as session t
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabled]
        def self.new(type:, **args)
          case type.to_sym
          when :enabled
            Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsEnabled.new(**args)
          when :disabled
            Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabled.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsMultiagentSubagents = Beta::BetaManagedAgentsMultiagentSubagents
  end
end
