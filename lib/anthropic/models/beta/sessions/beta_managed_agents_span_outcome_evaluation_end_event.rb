# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSpanOutcomeEvaluationEndEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute explanation
          #   Human-readable explanation of the verdict. For `needs_revision`, describes which
          #   criteria failed and why.
          #
          #   @return [String]
          required :explanation, String

          # @!attribute iteration
          #   0-indexed revision cycle, matching the corresponding
          #   `span.outcome_evaluation_start`.
          #
          #   @return [Integer]
          required :iteration, Integer

          # @!attribute outcome_evaluation_start_id
          #   The id of the corresponding `span.outcome_evaluation_start` event.
          #
          #   @return [String]
          required :outcome_evaluation_start_id, String

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

          # @!attribute result
          #   Evaluation verdict. 'satisfied': criteria met, session goes idle.
          #   'needs_revision': criteria not met, another revision cycle follows.
          #   'max_iterations_reached': evaluation budget exhausted with criteria still unmet
          #   — one final acknowledgment turn follows before the session goes idle, but no
          #   further evaluation runs. 'failed': grader determined the rubric does not apply
          #   to the deliverables. 'interrupted': user sent an interrupt while evaluation was
          #   in progress.
          #
          #   @return [String]
          required :result, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent::Type }

          # @!attribute usage
          #   Token usage for a single model request.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelUsage]
          required :usage, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage }

          # @!method initialize(id:, explanation:, iteration:, outcome_evaluation_start_id:, outcome_id:, processed_at:, result:, type:, usage:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent}
          #   for more details.
          #
          #   Emitted when an outcome evaluation cycle completes. Carries the verdict and
          #   aggregate token usage. A verdict of `needs_revision` means another evaluation
          #   cycle follows; `satisfied`, `max_iterations_reached`, `failed`, or `interrupted`
          #   are terminal — no further evaluation cycles follow.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param explanation [String] Human-readable explanation of the verdict. For `needs_revision`, describes which
          #
          #   @param iteration [Integer] 0-indexed revision cycle, matching the corresponding `span.outcome_evaluation_st
          #
          #   @param outcome_evaluation_start_id [String] The id of the corresponding `span.outcome_evaluation_start` event.
          #
          #   @param outcome_id [String] The `outc_` ID of the outcome being evaluated.
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param result [String] Evaluation verdict. 'satisfied': criteria met, session goes idle. 'needs_revisio
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent::Type]
          #
          #   @param usage [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanModelUsage] Token usage for a single model request.

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SPAN_OUTCOME_EVALUATION_END = :"span.outcome_evaluation_end"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
