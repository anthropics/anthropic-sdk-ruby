# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEffortLow = Beta::BetaManagedAgentsEffortLow

    module Beta
      class BetaManagedAgentsEffortLow < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEffortLow,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Low effort. Favors latency over reasoning depth.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :low)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
