# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Describes what triggered a deployment run, with trigger-specific metadata.
      module BetaManagedAgentsTriggerContext
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # The run was fired by the deployment's cron schedule.
        variant :schedule, -> { Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext }

        # The run was started manually by creating a session directly against the deployment.
        variant :manual, -> { Anthropic::Beta::BetaManagedAgentsManualTriggerContext }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsScheduleTriggerContext, Anthropic::Models::Beta::BetaManagedAgentsManualTriggerContext)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Time] :scheduled_at A timestamp in RFC 3339 format
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsScheduleTriggerContext, Anthropic::Models::Beta::BetaManagedAgentsManualTriggerContext]
        def self.new(type:, **args)
          case type.to_sym
          when :schedule
            Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext.new(**args)
          when :manual
            Anthropic::Beta::BetaManagedAgentsManualTriggerContext.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsTriggerContext = Beta::BetaManagedAgentsTriggerContext
  end
end
