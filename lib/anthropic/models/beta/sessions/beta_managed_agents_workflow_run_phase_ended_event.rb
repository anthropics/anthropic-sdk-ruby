# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunPhaseEndedEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute phase_started_id
          #   Identifier of the `workflow_run.phase_started` event that opened the phase.
          #
          #   @return [String]
          required :phase_started_id, String

          # @!attribute processed_at
          #   Timestamp when this event was processed.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, :"workflow_run.phase_ended"]
          required :type, const: :"workflow_run.phase_ended"

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

          # @!method initialize(id:, phase_started_id:, processed_at:, workflow_run_id:, workflow_run_phase_id:, type: :"workflow_run.phase_ended")
          #   A workflow run's plan left a phase, or the run's end closed it. Emitted once for
          #   every `workflow_run.phase_started` event, before the run's
          #   `workflow_run.status_ended` event. The event does not say whether the plan
          #   finished the phase's work, or why it left.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunPhaseEndedEvent}
          #   for more details.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param phase_started_id [String] Identifier of the `workflow_run.phase_started` event that opened the phase.
          #
          #   @param processed_at [Time] Timestamp when this event was processed.
          #
          #   @param workflow_run_id [String] Identifier of the run. The same value is on all of the run's `workflow_run.*` ev
          #
          #   @param workflow_run_phase_id [String] Identifier of the phase, as in `phases` on the run's `workflow_run.created` even
          #
          #   @param type [Symbol, :"workflow_run.phase_ended"]
        end
      end
    end
  end
end
