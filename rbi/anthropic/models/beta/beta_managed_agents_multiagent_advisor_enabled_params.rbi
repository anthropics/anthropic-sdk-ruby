# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentAdvisorEnabledParams =
      Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams

    module Beta
      class BetaManagedAgentsMultiagentAdvisorEnabledParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentAdvisorEnabledParams,
              Anthropic::Internal::AnyHash
            )
          end

        # A Claude model id. The model must be permitted as an advisor for this agent's
        # model.
        sig { returns(String) }
        attr_accessor :model

        sig { returns(Symbol) }
        attr_accessor :type

        # The session's primary thread can consult `model` mid-turn.
        sig { params(model: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # A Claude model id. The model must be permitted as an advisor for this agent's
          # model.
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
