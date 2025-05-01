# typed: strong

module Anthropic
  module Models
    BetaSignatureDelta = Beta::BetaSignatureDelta

    module Beta
      class BetaSignatureDelta < Anthropic::Internal::Type::BaseModel
        sig { returns(String) }
        attr_accessor :signature

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(signature: String, type: Symbol).returns(T.attached_class) }
        def self.new(signature:, type: :signature_delta); end

        sig { override.returns({signature: String, type: Symbol}) }
        def to_hash; end
      end
    end
  end
end
