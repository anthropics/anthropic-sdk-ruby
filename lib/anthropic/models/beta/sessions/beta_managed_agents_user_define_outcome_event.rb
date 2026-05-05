# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserDefineOutcomeEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute description
          #   What the agent should produce. Copied from the input event.
          #
          #   @return [String]
          required :description, String

          # @!attribute max_iterations
          #   Evaluate-then-revise cycles before giving up. Default 3, max 20.
          #
          #   @return [Integer, nil]
          required :max_iterations, Integer, nil?: true

          # @!attribute outcome_id
          #   Server-generated `outc_` ID for this outcome. Referenced by
          #   `span.outcome_evaluation_*` events and the session's `outcome_evaluations` list.
          #
          #   @return [String]
          required :outcome_id, String

          # @!attribute processed_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute rubric
          #   Rubric for grading the quality of an outcome.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric]
          required :rubric, union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Rubric }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Type }

          # @!method initialize(id:, description:, max_iterations:, outcome_id:, processed_at:, rubric:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent} for
          #   more details.
          #
          #   Echo of a `user.define_outcome` input event. Carries the server-generated
          #   `outcome_id` that subsequent `span.outcome_evaluation_*` events reference.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param description [String] What the agent should produce. Copied from the input event.
          #
          #   @param max_iterations [Integer, nil] Evaluate-then-revise cycles before giving up. Default 3, max 20.
          #
          #   @param outcome_id [String] Server-generated `outc_` ID for this outcome. Referenced by `span.outcome_evalua
          #
          #   @param processed_at [Time] A timestamp in RFC 3339 format
          #
          #   @param rubric [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric] Rubric for grading the quality of an outcome.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Type]

          # Rubric for grading the quality of an outcome.
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent#rubric
          module Rubric
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Rubric referenced by a file uploaded via the Files API.
            variant :file, -> { Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric }

            # Rubric content provided inline as text.
            variant :text, -> { Anthropic::Beta::Sessions::BetaManagedAgentsTextRubric }

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubric, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubric)]
          end

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent#type
          module Type
            extend Anthropic::Internal::Type::Enum

            USER_DEFINE_OUTCOME = :"user.define_outcome"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
