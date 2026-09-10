# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentAutoEvaluatedPermissionDeny < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionDeny,
                Anthropic::Internal::AnyHash
              )
            end

          # The judgement's grounds in registry-bound terms. Open registry; currently
          # "high_risk" (judged high-risk; the call does not run). Clients must tolerate
          # values outside this set.
          sig { returns(String) }
          attr_accessor :reason_code

          sig { returns(Symbol) }
          attr_accessor :type

          # The server judged the invocation high-risk; it does not execute and a synthetic
          # error tool result is appended.
          sig do
            params(reason_code: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # The judgement's grounds in registry-bound terms. Open registry; currently
            # "high_risk" (judged high-risk; the call does not run). Clients must tolerate
            # values outside this set.
            reason_code:,
            type: :deny
          )
          end

          sig { override.returns({ reason_code: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
