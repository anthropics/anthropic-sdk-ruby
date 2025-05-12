# typed: strong

module Anthropic
  module Models
    BetaToolChoiceNone = Beta::BetaToolChoiceNone

    module Beta
      class BetaToolChoiceNone < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolChoiceNone,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The model will not be allowed to use tools.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :none)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
