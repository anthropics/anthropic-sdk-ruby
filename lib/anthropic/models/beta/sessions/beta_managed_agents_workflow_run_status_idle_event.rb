# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunStatusIdleEvent < Anthropic::Internal::Type::BaseModel
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
          #   @return [Symbol, :"workflow_run.status_idle"]
          required :type, const: :"workflow_run.status_idle"

          # @!attribute workflow_run_id
          #   Identifier of the run. The same value is on all of the run's `workflow_run.*`
          #   events.
          #
          #   @return [String]
          required :workflow_run_id, String

          # @!method initialize(id:, processed_at:, workflow_run_id:, type: :"workflow_run.status_idle")
          #   A workflow run is idle. Emitted each time the run goes idle, whatever the cause.
          #   If the run ends while idle, no `workflow_run.status_running` comes between this
          #   event and its `workflow_run.status_ended`.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunStatusIdleEvent}
          #   for more details.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param processed_at [Time] Timestamp when this event was processed.
          #
          #   @param workflow_run_id [String] Identifier of the run. The same value is on all of the run's `workflow_run.*` ev
          #
          #   @param type [Symbol, :"workflow_run.status_idle"]
        end
      end
    end
  end
end
