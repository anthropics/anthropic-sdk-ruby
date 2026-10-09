# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunErrorEvent < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for this event.
          #
          #   @return [String]
          required :id, String

          # @!attribute error
          #   Why the run did not finish, or was not created.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError]
          required :error, union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError }

          # @!attribute processed_at
          #   Timestamp when this event was processed.
          #
          #   @return [Time]
          required :processed_at, Time

          # @!attribute type
          #
          #   @return [Symbol, :"workflow_run.error"]
          required :type, const: :"workflow_run.error"

          # @!attribute workflow_run_id
          #   Identifier of the run that met the error, or `null` when the error kept a run
          #   from being created.
          #
          #   @return [String, nil]
          required :workflow_run_id, String, nil?: true

          # @!method initialize(id:, error:, processed_at:, workflow_run_id:, type: :"workflow_run.error")
          #   A workflow run met an error, or an error kept a run from being created. A run
          #   that ends with a `result.type` of `error` emits this event before its
          #   `workflow_run.status_ended`, with the same `error`.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunErrorEvent} for
          #   more details.
          #
          #   @param id [String] Unique identifier for this event.
          #
          #   @param error [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError] Why the run did not finish, or was not created.
          #
          #   @param processed_at [Time] Timestamp when this event was processed.
          #
          #   @param workflow_run_id [String, nil] Identifier of the run that met the error, or `null` when the error kept a run fr
          #
          #   @param type [Symbol, :"workflow_run.error"]
        end
      end
    end
  end
end
