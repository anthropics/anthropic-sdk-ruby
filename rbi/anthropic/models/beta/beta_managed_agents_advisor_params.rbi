# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAdvisorParams = Beta::BetaManagedAgentsAdvisorParams

    module Beta
      class BetaManagedAgentsAdvisorParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAdvisorParams,
              Anthropic::Internal::AnyHash
            )
          end

        # A Claude model id. The model must be permitted as an advisor for this agent's
        # model.
        sig { returns(String) }
        attr_accessor :model

        sig { returns(Symbol) }
        attr_accessor :type

        # Platform advisor roster entry: a model the session's primary thread may consult
        # mid-turn. At most one per roster; the entry occupies the roster name
        # `anthropic.advisor`.
        sig { params(model: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # A Claude model id. The model must be permitted as an advisor for this agent's
          # model.
          model:,
          type: :advisor
        )
        end

        sig { override.returns({ model: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
