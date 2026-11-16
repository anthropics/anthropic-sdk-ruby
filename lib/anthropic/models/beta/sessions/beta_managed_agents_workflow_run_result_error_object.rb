# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunResultErrorObject < Anthropic::Internal::Type::BaseModel
          # @!attribute error
          #   Why the run did not finish.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunErrorObject, Anthropic::Models::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunErrorObject, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunErrorObject, Anthropic::Models::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunErrorObject, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunErrorObject]
          required :error, union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunErrorObject }

          # @!attribute type
          #
          #   @return [Symbol, :error]
          required :type, const: :error

          # @!method initialize(error:, type: :error)
          #   The run failed or reached its time limit.
          #
          #   @param error [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunErrorObject, Anthropic::Models::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunErrorObject, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunErrorObject, Anthropic::Models::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunErrorObject, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunErrorObject] Why the run did not finish.
          #
          #   @param type [Symbol, :error]
        end
      end
    end
  end
end
