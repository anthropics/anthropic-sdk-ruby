# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Whether the agent can spawn session threads.
      module BetaManagedAgentsSessionMultiagentSubagents
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The agent can spawn session threads.
        variant :enabled, -> { Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagentsEnabled }

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
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentSubagentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabled)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentSubagents} for more
        # details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentSubagents::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled] :inline_agents Whether the agent can define inline agents, which are not saved, when it spawns
        #
        #   @option args [Array<Anthropic::Models::Beta::BetaManagedAgentsSessionThreadAgent>] :predefined_agents Full `agent` definitions of the predefined agents, which are saved agents that t
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsSessionMultiagentSubagentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentSubagentsDisabled]
        def self.new(type:, **args)
          case type.to_sym
          when :enabled
            Anthropic::Beta::BetaManagedAgentsSessionMultiagentSubagentsEnabled.new(**args)
          when :disabled
            Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabled.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsSessionMultiagentSubagents = Beta::BetaManagedAgentsSessionMultiagentSubagents
  end
end
