# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentAdvisorDisabled =
      Beta::BetaManagedAgentsMultiagentAdvisorDisabled

    module Beta
      class BetaManagedAgentsMultiagentAdvisorDisabled < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorDisabled,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The agent has no advisor.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :disabled)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
