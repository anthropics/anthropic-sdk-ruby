# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEffortMedium = Beta::BetaManagedAgentsEffortMedium

    module Beta
      class BetaManagedAgentsEffortMedium < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEffortMedium,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Medium effort. Balances latency and reasoning depth.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :medium)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
