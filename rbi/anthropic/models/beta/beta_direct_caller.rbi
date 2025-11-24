# typed: strong

module Anthropic
  module Models
    BetaDirectCaller = Beta::BetaDirectCaller

    module Beta
      class BetaDirectCaller < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDirectCaller,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # Tool invocation directly from the model.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :direct)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
