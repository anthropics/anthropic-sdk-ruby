# typed: strong

module Anthropic
  module Models
    BetaOutputBehaviorCreateNew = Beta::BetaOutputBehaviorCreateNew

    module Beta
      class BetaOutputBehaviorCreateNew < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaOutputBehaviorCreateNew,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Write the result to a new memory store that starts as a copy of the input memory
        # store. This is the default.
        #
        # The new memory store is in the same workspace as the dream. The dream doesn't
        # change the input memory store.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :create_new)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
