# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEffortMax = Beta::BetaManagedAgentsEffortMax

    module Beta
      class BetaManagedAgentsEffortMax < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEffortMax,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Maximum effort. Favors reasoning depth over latency.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :max)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
