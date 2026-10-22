# typed: strong

module Anthropic
  module Models
    BetaThreadCreateParams = Beta::BetaThreadCreateParams

    module Beta
      class BetaThreadCreateParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThreadCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Start holding conversation state under this response's `id`.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :create)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
