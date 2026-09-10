# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentAutoEvaluatedPermissionAsk < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAsk,
                Anthropic::Internal::AnyHash
              )
            end

          # The judgement's grounds in registry-bound terms, for client branching and audit
          # rather than end-user display. Open registry; currently "indeterminate" (no
          # judgement was reached). Clients must tolerate values outside this set.
          sig { returns(String) }
          attr_accessor :reason_code

          sig { returns(Symbol) }
          attr_accessor :type

          # The server reached no judgement; the invocation is held for client approval.
          sig do
            params(reason_code: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # The judgement's grounds in registry-bound terms, for client branching and audit
            # rather than end-user display. Open registry; currently "indeterminate" (no
            # judgement was reached). Clients must tolerate values outside this set.
            reason_code:,
            type: :ask
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
