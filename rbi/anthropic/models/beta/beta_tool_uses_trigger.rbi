# typed: strong

module Anthropic
  module Models
    BetaToolUsesTrigger = Beta::BetaToolUsesTrigger

    module Beta
      class BetaToolUsesTrigger < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolUsesTrigger,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(Integer) }
        attr_accessor :value

        sig { params(value: Integer, type: Symbol).returns(T.attached_class) }
        def self.new(value:, type: :tool_uses)
        end

        sig { override.returns({ type: Symbol, value: Integer }) }
        def to_hash
        end
      end
    end
  end
end
