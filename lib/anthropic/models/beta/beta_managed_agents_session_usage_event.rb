# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSessionUsageEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique identifier for this event.
        #
        #   @return [String]
        required :id, String

        # @!attribute processed_at
        #   Timestamp when the snapshot was taken.
        #
        #   @return [Time]
        required :processed_at, Time

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionUsageEvent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSessionUsageEvent::Type }

        # @!attribute usage
        #   The session's cumulative usage at the snapshot time.
        #
        #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot]
        required :usage, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot }

        # @!attribute budget
        #   The session's configured budget at the snapshot time, or null when the session
        #   has no budget.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit, nil]
        optional :budget, -> { Anthropic::Beta::BetaManagedAgentsBudgetLimit }, nil?: true

        # @!method initialize(id:, processed_at:, type:, usage:, budget: nil)
        #   Periodic snapshot of the session's cumulative usage and tracked list cost.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsSessionUsageEvent} for more details.
        #
        #   @param id [String] Unique identifier for this event.
        #
        #   @param processed_at [Time] Timestamp when the snapshot was taken.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionUsageEvent::Type]
        #
        #   @param usage [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot] The session's cumulative usage at the snapshot time.
        #
        #   @param budget [Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit, nil] The session's configured budget at the snapshot time, or null when the session h

        # @see Anthropic::Models::Beta::BetaManagedAgentsSessionUsageEvent#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SESSION_USAGE = :"session.usage"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSessionUsageEvent = Beta::BetaManagedAgentsSessionUsageEvent
  end
end
