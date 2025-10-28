# typed: strong

module Anthropic
  module Models
    BetaAllThinkingTurns = Beta::BetaAllThinkingTurns

    module Beta
      class BetaAllThinkingTurns < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaAllThinkingTurns,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :all)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
