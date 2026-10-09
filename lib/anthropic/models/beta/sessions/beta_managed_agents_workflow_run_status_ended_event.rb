# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunStatusEndedEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute processed_at
          #   Timestamp when this event was processed.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute result
          #   How the run ended.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResultCompleted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResultError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResultStopped]
          required :result, union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResult }

          # @!attribute type
          #
          #   @return [Symbol, :"workflow_run.status_ended"]
          required :type, const: :"workflow_run.status_ended"

          # @!attribute workflow_run_id
          #   Identifier of the run. The same value is on all of the run's `workflow_run.*`
          #   events.
          #
          #   @return [String]
          required :workflow_run_id, String

          # @!method initialize(id:, processed_at:, result:, workflow_run_id:, type: :"workflow_run.status_ended")
          #   A workflow run ended. Emitted once per run, as the last of the run's
          #   `workflow_run.*` events.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunStatusEndedEvent}
          #   for more details.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] Timestamp when this event was processed.
          #
          #   @param result [Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResultCompleted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResultError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResultStopped] How the run ended.
          #
          #   @param workflow_run_id [String] Identifier of the run. The same value is on all of the run's `workflow_run.*` ev
          #
          #   @param type [Symbol, :"workflow_run.status_ended"]
        end
      end
    end
  end
end
