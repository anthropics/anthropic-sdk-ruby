# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentAdvisorEnabled =
      Beta::BetaManagedAgentsMultiagentAdvisorEnabled

    module Beta
      class BetaManagedAgentsMultiagentAdvisorEnabled < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorEnabled,
              Anthropic::Internal::AnyHash
            )
          end

        # The advisor model id.
        sig { returns(String) }
        attr_accessor :model

        sig { returns(Symbol) }
        attr_accessor :type

        # The session's primary thread can consult `model` mid-turn.
        sig { params(model: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # The advisor model id.
          model:,
          type: :enabled
        )
        end

        sig { override.returns({ model: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
