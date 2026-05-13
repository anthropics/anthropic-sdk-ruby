# typed: strong

module Anthropic
  module Models
    BetaCacheMissUnavailable = Beta::BetaCacheMissUnavailable

    module Beta
      class BetaCacheMissUnavailable < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCacheMissUnavailable,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :unavailable)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
