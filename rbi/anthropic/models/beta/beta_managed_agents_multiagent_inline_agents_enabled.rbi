# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentInlineAgentsEnabled =
      Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled

    module Beta
      class BetaManagedAgentsMultiagentInlineAgentsEnabled < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabled,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The agent can define inline agents.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :enabled)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
