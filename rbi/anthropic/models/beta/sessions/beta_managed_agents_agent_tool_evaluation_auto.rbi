# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentToolEvaluationAuto < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAuto,
                Anthropic::Internal::AnyHash
              )
            end

          # The server's per-invocation judgement under the auto permission policy. Its type
          # always equals the event's top-level evaluated_permission. Open union: clients
          # must tolerate unknown variants.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermission::Variants
            )
          end
          attr_accessor :evaluated_permission

          sig { returns(Symbol) }
          attr_accessor :type

          # The resolved permission_policy was auto: the server judged this invocation
          # individually.
          sig do
            params(
              evaluated_permission:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAllow::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The server's per-invocation judgement under the auto permission policy. Its type
            # always equals the event's top-level evaluated_permission. Open union: clients
            # must tolerate unknown variants.
            evaluated_permission:,
            type: :auto
          )
          end

          sig do
            override.returns(
              {
                evaluated_permission:
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermission::Variants,
                type: Symbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
