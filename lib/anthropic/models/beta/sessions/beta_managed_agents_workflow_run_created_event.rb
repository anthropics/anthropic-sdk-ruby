# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunCreatedEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute description
          #   Description that the agent gave the run, passed on as written, or `null` if it
          #   gave none.
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!attribute name
          #   Name that the agent gave the run, passed on as written, or a name that the
          #   server assigned.
          #
          #   @return [String]
          required :name, String

          # @!attribute phases
          #   The phases that the run's plan declares, in the plan's order. Can be empty.
          #
          #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunPhase>]
          required :phases,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunPhase] }

          # @!attribute processed_at
          #   Timestamp when this event was processed.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, :"workflow_run.created"]
          required :type, const: :"workflow_run.created"

          # @!attribute workflow_run_id
          #   Identifier of the run. The same value is on all of the run's `workflow_run.*`
          #   events.
          #
          #   @return [String]
          required :workflow_run_id, String

          # @!method initialize(id:, description:, name:, phases:, processed_at:, workflow_run_id:, type: :"workflow_run.created")
          #   A workflow run was created. A workflow run is background work that the session's
          #   agent starts. Emitted once per run, before the run's other `workflow_run.*`
          #   events.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunCreatedEvent}
          #   for more details.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param description [String, nil] Description that the agent gave the run, passed on as written, or `null` if it g
          #
          #   @param name [String] Name that the agent gave the run, passed on as written, or a name that the serve
          #
          #   @param phases [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunPhase>] The phases that the run's plan declares, in the plan's order. Can be empty.
          #
          #   @param processed_at [Time] Timestamp when this event was processed.
          #
          #   @param workflow_run_id [String] Identifier of the run. The same value is on all of the run's `workflow_run.*` ev
          #
          #   @param type [Symbol, :"workflow_run.created"]
        end
      end
    end
  end
end
