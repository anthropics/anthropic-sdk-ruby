# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsMaxWorkflowRunsWorkflowRunError < Anthropic::Internal::Type::BaseModel
          # @!attribute message
          #   Short explanation written by the server. It never contains content from the run
          #   or its agents.
          #
          #   @return [String]
          required :message, String

          # @!attribute type
          #
          #   @return [Symbol, :max_workflow_runs_error]
          required :type, const: :max_workflow_runs_error

          # @!method initialize(message:, type: :max_workflow_runs_error)
          #   No run was created, because the session was at its limit of open workflow runs,
          #   which are runs that have not ended. Only `workflow_run.error` carries this type.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError}
          #   for more details.
          #
          #   @param message [String] Short explanation written by the server. It never contains content from the run
          #
          #   @param type [Symbol, :max_workflow_runs_error]
        end
      end
    end
  end
end
