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
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time]
        required :processed_at, Time

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionUsageEvent::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSessionUsageEvent::Type }

        # @!attribute usage
        #   Point-in-time snapshot of a session's cumulative usage.
        #
        #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot]
        required :usage, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot }

        # @!attribute budget
        #   A hard spend ceiling. The session stops issuing new model requests once the
        #   tracked list cost reaches `max_list_cost`.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit, nil]
        optional :budget, -> { Anthropic::Beta::BetaManagedAgentsBudgetLimit }, nil?: true

        # @!method initialize(id:, processed_at:, type:, usage:, budget: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsSessionUsageEvent} for more details.
        #
        #   Periodic snapshot of the session's cumulative usage and tracked list cost.
        #
        #   @param id [String] Unique identifier for this event.
        #
        #   @param processed_at [Time] A timestamp in RFC 3339 format
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSessionUsageEvent::Type]
        #
        #   @param usage [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSessionUsageSnapshot] Point-in-time snapshot of a session's cumulative usage.
        #
        #   @param budget [Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit, nil] A hard spend ceiling. The session stops issuing new model requests once the trac

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
