# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunResultError < Anthropic::Internal::Type::BaseModel
          # @!attribute error
          #   Why the run did not finish.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError]
          required :error, union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError }

          # @!attribute type
          #
          #   @return [Symbol, :error]
          required :type, const: :error

          # @!method initialize(error:, type: :error)
          #   The run failed or reached its time limit.
          #
          #   @param error [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError] Why the run did not finish.
          #
          #   @param type [Symbol, :error]
        end
      end
    end
  end
end
