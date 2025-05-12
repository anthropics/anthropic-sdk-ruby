# typed: strong

module Anthropic
  module Models
    class ThinkingConfigDisabled < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ThinkingConfigDisabled, Anthropic::Internal::AnyHash)
        end

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(type: Symbol).returns(T.attached_class) }
      def self.new(type: :disabled)
      end

      sig { override.returns({ type: Symbol }) }
      def to_hash
      end
    end
  end
end
