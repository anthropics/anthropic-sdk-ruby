# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentWorkflowsDisabled =
      Beta::BetaManagedAgentsMultiagentWorkflowsDisabled

    module Beta
      class BetaManagedAgentsMultiagentWorkflowsDisabled < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentWorkflowsDisabled,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The agent cannot start workflow runs.
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
