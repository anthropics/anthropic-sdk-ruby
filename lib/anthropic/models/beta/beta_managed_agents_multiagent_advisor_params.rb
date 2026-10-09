# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Whether the session's primary thread can consult an advisor model.
      module BetaManagedAgentsMultiagentAdvisorParams
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The session's primary thread can consult `model` mid-turn.
        variant :enabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams }

        # The agent has no advisor.
        variant :disabled, -> { Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorDisabledParams }

        module Type
          extend Anthropic::Internal::Type::Enum

          ENABLED = :enabled
          DISABLED = :disabled

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorDisabledParams)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorParams} for more
        # details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorParams::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :model A Claude model id. The model must be permitted as an advisor for this agent's mo
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams, Anthropic::Models::Beta::BetaManagedAgentsMultiagentAdvisorDisabledParams]
        def self.new(type:, **args)
          case type.to_sym
          when :enabled
            Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams.new(**args)
          when :disabled
            Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorDisabledParams.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsMultiagentAdvisorParams = Beta::BetaManagedAgentsMultiagentAdvisorParams
  end
end
