# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaThinkingConfigDisabled < Anthropic::Internal::Type::BaseModel
        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :disabled)
        end

        sig { override.returns({type: Symbol}) }
        def to_hash
        end
      end
    end

    BetaThinkingConfigDisabled = Beta::BetaThinkingConfigDisabled
  end
end
