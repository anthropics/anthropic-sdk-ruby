# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAlwaysAllowPolicy =
      Beta::BetaManagedAgentsAlwaysAllowPolicy

    module Beta
      class BetaManagedAgentsAlwaysAllowPolicy < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAlwaysAllowPolicy,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Tool calls are automatically approved without user confirmation.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :always_allow)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
