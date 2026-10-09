# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMultiagentSubagentsDisabled =
      Beta::BetaManagedAgentsMultiagentSubagentsDisabled

    module Beta
      class BetaManagedAgentsMultiagentSubagentsDisabled < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMultiagentSubagentsDisabled,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The agent cannot spawn session threads.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :disabled)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
