# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentToolEvaluationAuto < Anthropic::Internal::Type::BaseModel
          # @!attribute evaluated_permission
          #   The server's per-invocation judgement under the auto permission policy. Its type
          #   always equals the event's top-level evaluated_permission. Open union: clients
          #   must tolerate unknown variants.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAllow, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny]
          required :evaluated_permission,
                   union: -> { Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermission }

          # @!attribute type
          #
          #   @return [Symbol, :auto]
          required :type, const: :auto

          # @!method initialize(evaluated_permission:, type: :auto)
          #   The resolved permission_policy was auto: the server judged this invocation
          #   individually.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAuto}
          #   for more details.
          #
          #   @param evaluated_permission [Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAllow, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny] The server's per-invocation judgement under the auto permission policy. Its type
          #
          #   @param type [Symbol, :auto]
        end
      end
    end
  end
end
