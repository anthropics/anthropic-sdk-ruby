# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentSelfParams =
      Beta::BetaManagedAgentsMultiagentSelfParams

    module Beta
      class BetaManagedAgentsMultiagentSelfParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentSelfParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Sentinel roster entry meaning "the agent that owns this configuration". Resolved
        # server-side to a concrete agent reference.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :self)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
