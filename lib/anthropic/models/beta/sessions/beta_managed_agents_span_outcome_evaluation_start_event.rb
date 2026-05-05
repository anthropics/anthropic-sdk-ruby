# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSpanOutcomeEvaluationStartEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute iteration
          #   0-indexed revision cycle. 0 is the first evaluation; 1 is the re-evaluation
          #   after the first revision; etc.
          #
          #   @return [Integer]
          required :iteration, Integer

          # @!attribute outcome_id
          #   The `outc_` ID of the outcome being evaluated.
          #
          #   @return [String]
          required :outcome_id, String

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent::Type }

          # @!method initialize(id:, iteration:, outcome_id:, processed_at:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent}
          #   for more details.
          #
          #   Emitted when an outcome evaluation cycle begins.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param iteration [Integer] 0-indexed revision cycle. 0 is the first evaluation; 1 is the re-evaluation afte
          #
          #   @param outcome_id [String] The `outc_` ID of the outcome being evaluated.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SPAN_OUTCOME_EVALUATION_START = :"span.outcome_evaluation_start"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
