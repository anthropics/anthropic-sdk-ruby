# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentToolEvaluationAuto < Anthropic::Internal::Type::BaseModel
          # @!attribute evaluated_permission
          #   The server's judgement for this invocation.
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
          #   @param evaluated_permission [Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAllow, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk, Anthropic::Models::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny] The server's judgement for this invocation.
          #
          #   @param type [Symbol, :auto]
        end
      end
    end
  end
end
