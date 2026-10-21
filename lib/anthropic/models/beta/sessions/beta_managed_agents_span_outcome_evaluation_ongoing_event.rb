# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute iteration
          #   0-indexed revision cycle, matching the corresponding
          #   `span.outcome_evaluation_start`.
          #
          #   @return [Integer]
          required :iteration, Integer

          # @!attribute outcome_id
          #   The `outc_` ID of the outcome being evaluated.
          #
          #   @return [String]
          required :outcome_id, String

          # @!attribute processed_at
          #   Timestamp when this heartbeat was emitted.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, :"span.outcome_evaluation_ongoing"]
          required :type, const: :"span.outcome_evaluation_ongoing"

          # @!method initialize(id:, iteration:, outcome_id:, processed_at:, type: :"span.outcome_evaluation_ongoing")
          #   Periodic heartbeat emitted while an outcome evaluation cycle is in progress.
          #   Distinguishes 'evaluation is actively running' from 'evaluation is stuck'
          #   between the corresponding `span.outcome_evaluation_start` and
          #   `span.outcome_evaluation_end` events.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent}
          #   for more details.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param iteration [Integer] 0-indexed revision cycle, matching the corresponding `span.outcome_evaluation_st
          #
          #   @param outcome_id [String] The `outc_` ID of the outcome being evaluated.
          #
          #   @param processed_at [Time] Timestamp when this heartbeat was emitted.
          #
          #   @param type [Symbol, :"span.outcome_evaluation_ongoing"]
        end
      end
    end
  end
end
