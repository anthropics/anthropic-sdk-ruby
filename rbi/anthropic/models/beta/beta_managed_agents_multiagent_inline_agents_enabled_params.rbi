# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentInlineAgentsEnabledParams =
      Beta::BetaManagedAgentsMultiagentInlineAgentsEnabledParams

    module Beta
      class BetaManagedAgentsMultiagentInlineAgentsEnabledParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentInlineAgentsEnabledParams,
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
