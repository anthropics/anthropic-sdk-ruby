# typed: strong

module Anthropic
  module Models
    BetaTextDelta = Beta::BetaTextDelta

    module Beta
      class BetaTextDelta < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Anthropic::Internal::AnyHash) }

        sig { returns(String) }
        attr_accessor :text

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(text: String, type: Symbol).returns(T.attached_class) }
        def self.new(text:, type: :text_delta)
        end

        sig { override.returns({ text: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
