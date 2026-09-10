# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsAgentAutoEvaluatedPermissionAllow < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsAgentAutoEvaluatedPermissionAllow,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The server judged the invocation safe to execute without client approval.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(type: :allow)
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
