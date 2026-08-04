# typed: strong

module Anthropic
  module Models
    class RedactedThinkingBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::RedactedThinkingBlockParam,
            Anthropic::Internal::AnyHash
          )
        end

      # The `data` value of this redacted thinking block, exactly as returned by the API
      # in a previous response. Opaque and encrypted; pass it back unchanged.
      sig { returns(String) }
      attr_accessor :data

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(data: String, type: Symbol).returns(T.attached_class) }
      def self.new(
        # The `data` value of this redacted thinking block, exactly as returned by the API
        # in a previous response. Opaque and encrypted; pass it back unchanged.
        data:,
        type: :redacted_thinking
      )
      end

      sig { override.returns({ data: String, type: Symbol }) }
      def to_hash
      end
    end
  end
end
