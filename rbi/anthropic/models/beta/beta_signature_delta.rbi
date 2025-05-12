# typed: strong

module Anthropic
  module Models
    BetaSignatureDelta = Beta::BetaSignatureDelta

    module Beta
      class BetaSignatureDelta < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaSignatureDelta,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :signature

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(signature: String, type: Symbol).returns(T.attached_class)
        end
        def self.new(signature:, type: :signature_delta)
        end

        sig { override.returns({ signature: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
