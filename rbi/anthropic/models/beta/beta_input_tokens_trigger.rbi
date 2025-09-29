# typed: strong

module Anthropic
  module Models
    BetaInputTokensTrigger = Beta::BetaInputTokensTrigger

    module Beta
      class BetaInputTokensTrigger < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaInputTokensTrigger,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(Integer) }
        attr_accessor :value

        sig { params(value: Integer, type: Symbol).returns(T.attached_class) }
        def self.new(value:, type: :input_tokens)
        end

        sig { override.returns({ type: Symbol, value: Integer }) }
        def to_hash
        end
      end
    end
  end
end
