# typed: strong

module Anthropic
  module Models
    BetaThinkingDelta = Beta::BetaThinkingDelta

    module Beta
      class BetaThinkingDelta < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaThinkingDelta,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :thinking

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(thinking: String, type: Symbol).returns(T.attached_class) }
        def self.new(thinking:, type: :thinking_delta)
        end

        sig { override.returns({ thinking: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
