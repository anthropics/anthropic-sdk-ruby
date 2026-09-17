# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # What triggered a deployment run.
      module BetaManagedAgentsTriggerType
        extend Anthropic::Internal::Type::Enum

        # The run was fired by the deployment's cron schedule.
        SCHEDULE = :schedule

        # The run was started manually by creating a session directly against the deployment.
        MANUAL = :manual

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaManagedAgentsTriggerType = Beta::BetaManagedAgentsTriggerType
  end
end
