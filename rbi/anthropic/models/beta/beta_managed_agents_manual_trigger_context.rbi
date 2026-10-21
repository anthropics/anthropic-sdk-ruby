# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsManualTriggerContext =
      Beta::BetaManagedAgentsManualTriggerContext

    module Beta
      class BetaManagedAgentsManualTriggerContext < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsManualTriggerContext,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The run was started manually by creating a session directly against the
        # deployment.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :manual)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
