# typed: strong

module Anthropic
  module Models
    BetaSignatureDelta = T.type_alias { Beta::BetaSignatureDelta }

    module Beta
      class BetaSignatureDelta < Anthropic::BaseModel
        sig { returns(String) }
        def signature
        end

        sig { params(_: String).returns(String) }
        def signature=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(signature: String, type: Symbol).returns(T.attached_class) }
        def self.new(signature:, type: :signature_delta)
        end

        sig { override.returns({signature: String, type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
