# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsScheduleTriggerContext < Anthropic::Internal::Type::BaseModel
        # @!attribute scheduled_at
        #   The UTC instant at which the cron expression matched in the configured timezone,
        #   before jitter is applied. At most one run is recorded per (`deployment_id`,
        #   `scheduled_at`) pair.
        #
        #   @return [Time]
        required :scheduled_at, Time

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsScheduleTriggerContext::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsScheduleTriggerContext::Type }

        # @!method initialize(scheduled_at:, type:)
        #   The run was fired by the deployment's cron schedule.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsScheduleTriggerContext} for more
        #   details.
        #
        #   @param scheduled_at [Time] The UTC instant at which the cron expression matched in the configured timezone,
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsScheduleTriggerContext::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsScheduleTriggerContext#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SCHEDULE = :schedule

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsScheduleTriggerContext = Beta::BetaManagedAgentsScheduleTriggerContext
  end
end
