# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEffortHigh = Beta::BetaManagedAgentsEffortHigh

    module Beta
      class BetaManagedAgentsEffortHigh < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEffortHigh,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # High effort. Favors reasoning depth.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :high)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
