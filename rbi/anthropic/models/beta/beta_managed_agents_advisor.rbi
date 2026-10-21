# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAdvisor = Beta::BetaManagedAgentsAdvisor

    module Beta
      class BetaManagedAgentsAdvisor < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAdvisor,
              Anthropic::Internal::AnyHash
            )
          end

        # The advisor model id.
        sig { returns(String) }
        attr_accessor :model

        sig { returns(Symbol) }
        attr_accessor :type

        # Platform advisor roster entry: a model the session's primary thread may consult
        # mid-turn.
        sig { params(model: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # The advisor model id.
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
