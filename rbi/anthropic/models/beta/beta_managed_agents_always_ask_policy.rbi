# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAlwaysAskPolicy = Beta::BetaManagedAgentsAlwaysAskPolicy

    module Beta
      class BetaManagedAgentsAlwaysAskPolicy < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAlwaysAskPolicy,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Tool calls require user confirmation before execution.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :always_ask)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
