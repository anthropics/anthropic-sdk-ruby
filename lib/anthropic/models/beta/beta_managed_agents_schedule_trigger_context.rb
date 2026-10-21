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
        #   @return [Symbol, :schedule]
        required :type, const: :schedule

        # @!method initialize(scheduled_at:, type: :schedule)
        #   The run was fired by the deployment's cron schedule.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsScheduleTriggerContext} for more
        #   details.
        #
        #   @param scheduled_at [Time] The UTC instant at which the cron expression matched in the configured timezone,
        #
        #   @param type [Symbol, :schedule]
      end
    end

    BetaManagedAgentsScheduleTriggerContext = Beta::BetaManagedAgentsScheduleTriggerContext
  end
end
