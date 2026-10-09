# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Whether the session's primary thread can consult an advisor model.
      module BetaManagedAgentsMultiagentAdvisor
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The session's primary thread can consult `model` mid-turn.
        variant :enabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorEnabled }

        # The agent has no advisor.
        variant :disabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorDisabled }

        module Type
          extend Anthropic::Internal::Type::Enum

          ENABLED = :enabled
          DISABLED = :disabled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorDisabled)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisor::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :model The advisor model id.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorEnabled, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorDisabled]
        def self.new(type:, **args)
          case type.to_sym
          when :enabled
            Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorEnabled.new(**args)
          when :disabled
            Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorDisabled.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsMultiagentAdvisor = Beta::BetaManagedAgentsMultiagentAdvisor
  end
end
