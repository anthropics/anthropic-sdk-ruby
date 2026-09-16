# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        # The server's per-invocation judgement under the auto permission policy. Its type
        # always equals the event's top-level evaluated_permission. Open union: clients
        # must tolerate unknown variants.
        module BetaManagedAgentsAgentAutoEvaluatedPermission
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAllow,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermission::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALLOW =
              T.let(
                :allow,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermission::Type::TaggedSymbol
              )
            ASK =
              T.let(
                :ask,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermission::Type::TaggedSymbol
              )
            DENY =
              T.let(
                :deny,
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermission::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermission::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermission::Variants
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
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermission::Type::OrSymbol,
              reason_code: String
            ).returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermission::Variants
            )
          end
          def self.new(
            type:,
            # The judgement's grounds in registry-bound terms, for client branching and audit
            # rather than end-user display. Open registry; currently "indeterminate" (no
            # judgement was reached). Clients must tolerate values outside this set.
            reason_code: nil
          )
          end
        end
      end
    end
  end
end
