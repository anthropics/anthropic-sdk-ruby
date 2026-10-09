# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunStatusRunningEvent < Anthropic::Internal::Type::BaseModel
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
          #   @return [Symbol, :"workflow_run.status_running"]
          required :type, const: :"workflow_run.status_running"

          # @!attribute workflow_run_id
          #   Identifier of the run. The same value is on all of the run's `workflow_run.*`
          #   events.
          #
          #   @return [String]
          required :workflow_run_id, String

          # @!method initialize(id:, processed_at:, workflow_run_id:, type: :"workflow_run.status_running")
          #   A workflow run is running. Emitted when the run starts to execute, and each time
          #   it resumes after being idle. A run that starts idle emits
          #   `workflow_run.status_idle` first.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunStatusRunningEvent}
          #   for more details.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] Timestamp when this event was processed.
          #
          #   @param workflow_run_id [String] Identifier of the run. The same value is on all of the run's `workflow_run.*` ev
          #
          #   @param type [Symbol, :"workflow_run.status_running"]
        end
      end
    end
  end
end
