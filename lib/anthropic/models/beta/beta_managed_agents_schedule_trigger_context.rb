# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsScheduleTriggerContext < Anthropic::Internal::Type::BaseModel
        # @!attribute scheduled_at
        #   A timestamp in RFC 3339 format
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
        #   @param scheduled_at [Time] A timestamp in RFC 3339 format
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
