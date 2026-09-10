# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentToolEvaluationAlwaysAllow < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentToolEvaluationAlwaysAllow,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The resolved permission_policy was always_allow; accompanies
          # evaluated_permission "allow".
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :always_allow)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
