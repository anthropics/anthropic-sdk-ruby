# typed: strong

module Anthropic
  module Models
    class ThinkingDelta < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ThinkingDelta, Anthropic::Internal::AnyHash)
        end

      # The incremental `thinking` text for this content block. Concatenate the
      # `thinking` values of successive `thinking_delta` events to assemble the block's
      # full `thinking` value.
      sig { returns(String) }
      attr_accessor :thinking

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(thinking: String, type: Symbol).returns(T.attached_class) }
      def self.new(
        # The incremental `thinking` text for this content block. Concatenate the
        # `thinking` values of successive `thinking_delta` events to assemble the block's
        # full `thinking` value.
        thinking:,
        type: :thinking_delta
      )
      end

      sig { override.returns({ thinking: String, type: Symbol }) }
      def to_hash
      end
    end
  end
end
