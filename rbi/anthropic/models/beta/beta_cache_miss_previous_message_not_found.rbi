# typed: strong

module Anthropic
  module Models
    BetaCacheMissPreviousMessageNotFound =
      Beta::BetaCacheMissPreviousMessageNotFound

    module Beta
      class BetaCacheMissPreviousMessageNotFound < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCacheMissPreviousMessageNotFound,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :previous_message_not_found)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
