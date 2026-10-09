# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Whether the agent can define inline agents. The agent defines an inline agent
      # itself, in a workflow run's plan or when it spawns a session thread, and the
      # inline agent is not saved.
      module BetaManagedAgentsMultiagentInlineAgents
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The agent can define inline agents.
        variant :enabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled }

        # The agent cannot define inline agents.
        variant :disabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled }

        module Type
          extend Anthropic::Internal::Type::Enum

          ENABLED = :enabled
          DISABLED = :disabled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgents::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled]
        def self.new(type:, **args)
          case type.to_sym
          when :enabled
            Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled.new(**args)
          when :disabled
            Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabled.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsMultiagentInlineAgents = Beta::BetaManagedAgentsMultiagentInlineAgents
  end
end
