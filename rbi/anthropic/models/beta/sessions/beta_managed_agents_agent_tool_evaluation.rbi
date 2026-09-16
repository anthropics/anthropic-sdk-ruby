# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        # Names the resolved permission_policy that produced evaluated_permission, and
        # under auto carries the judgement. Open union: clients must tolerate unknown
        # variants.
        module BetaManagedAgentsAgentToolEvaluation
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAllow,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAsk,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAuto
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALWAYS_ALLOW =
              T.let(
                :always_allow,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluation::Type::TaggedSymbol
              )
            ALWAYS_ASK =
              T.let(
                :always_ask,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluation::Type::TaggedSymbol
              )
            AUTO =
              T.let(
                :auto,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluation::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluation::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluation::Type::OrSymbol,
              evaluated_permission:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAllow::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny::OrHash
                )
            ).returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluation::Variants
            )
          end
          def self.new(
            type:,
            # The server's per-invocation judgement under the auto permission policy. Its type
            # always equals the event's top-level evaluated_permission. Open union: clients
            # must tolerate unknown variants.
            evaluated_permission: nil
          )
          end
        end
      end
    end
  end
end
