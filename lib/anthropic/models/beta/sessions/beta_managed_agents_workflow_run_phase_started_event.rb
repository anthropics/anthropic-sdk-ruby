# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunPhaseStartedEvent < Anthropic::Internal::Type::BaseModel
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

          # @!attribute type
          #
          #   @return [Symbol, :"workflow_run.phase_started"]
          required :type, const: :"workflow_run.phase_started"

          # @!attribute workflow_run_id
          #   Identifier of the run. The same value is on all of the run's `workflow_run.*`
          #   events.
          #
          #   @return [String]
          required :workflow_run_id, String

          # @!attribute workflow_run_phase_id
          #   Identifier of the phase, as in `phases` on the run's `workflow_run.created`
          #   event.
          #
          #   @return [String]
          required :workflow_run_phase_id, String

          # @!method initialize(id:, processed_at:, workflow_run_id:, workflow_run_phase_id:, type: :"workflow_run.phase_started")
          #   A workflow run's plan entered a phase.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunPhaseStartedEvent}
          #   for more details.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] Timestamp when this event was processed.
          #
          #   @param workflow_run_id [String] Identifier of the run. The same value is on all of the run's `workflow_run.*` ev
          #
          #   @param workflow_run_phase_id [String] Identifier of the phase, as in `phases` on the run's `workflow_run.created` even
          #
          #   @param type [Symbol, :"workflow_run.phase_started"]
        end
      end
    end
  end
end
