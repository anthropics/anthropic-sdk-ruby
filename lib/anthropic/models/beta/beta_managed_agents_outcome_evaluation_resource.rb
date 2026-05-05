# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsOutcomeEvaluationResource < Anthropic::Internal::Type::BaseModel
        # @!attribute completed_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time, nil]
        required :completed_at, Time, nil?: true

        # @!attribute description
        #   What the agent should produce.
        #
        #   @return [String]
        required :description, String

        # @!attribute explanation
        #   Grader's verdict text from the most recent evaluation. For satisfied, explains
        #   why criteria are met; for needs_revision (intermediate), what's missing; for
        #   failed, why unrecoverable.
        #
        #   @return [String, nil]
        required :explanation, String, nil?: true

        # @!attribute iteration
        #   0-indexed revision cycle the outcome is currently on.
        #
        #   @return [Integer]
        required :iteration, Integer

        # @!attribute outcome_id
        #   Server-generated outc\_ ID for this outcome.
        #
        #   @return [String]
        required :outcome_id, String

        # @!attribute result
        #   Current evaluation state. 'pending' before the agent begins work; 'running'
        #   while producing or revising; 'evaluating' while the grader scores;
        #   'satisfied'/'max_iterations_reached'/'failed'/'interrupted' are terminal.
        #
        #   @return [String]
        required :result, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsOutcomeEvaluationResource::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource::Type }

        # @!method initialize(completed_at:, description:, explanation:, iteration:, outcome_id:, result:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsOutcomeEvaluationResource} for more
        #   details.
        #
        #   Evaluation state for a single outcome defined via a define_outcome event.
        #
        #   @param completed_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param description [String] What the agent should produce.
        #
        #   @param explanation [String, nil] Grader's verdict text from the most recent evaluation. For satisfied, explains w
        #
        #   @param iteration [Integer] 0-indexed revision cycle the outcome is currently on.
        #
        #   @param outcome_id [String] Server-generated outc\_ ID for this outcome.
        #
        #   @param result [String] Current evaluation state. 'pending' before the agent begins work; 'running' whil
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsOutcomeEvaluationResource::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsOutcomeEvaluationResource#type
        module Type
          extend Anthropic::Internal::Type::Enum

          OUTCOME_EVALUATION = :outcome_evaluation

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsOutcomeEvaluationResource = Beta::BetaManagedAgentsOutcomeEvaluationResource
  end
end
