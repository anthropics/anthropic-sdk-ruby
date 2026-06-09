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
      end
    end

    BetaManagedAgentsTriggerContext = Beta::BetaManagedAgentsTriggerContext
  end
end
