# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentInlineAgentsDisabledParams =
      Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams

    module Beta
      class BetaManagedAgentsMultiagentInlineAgentsDisabledParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsDisabledParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The agent cannot define inline agents.
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
