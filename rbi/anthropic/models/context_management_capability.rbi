# typed: strong

module Anthropic
  module Models
    class ContextManagementCapability < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ContextManagementCapability,
            Anthropic::Internal::AnyHash
          )
        end

      # Whether the clear_thinking_20251015 strategy is supported.
      sig { returns(T.nilable(Anthropic::CapabilitySupport)) }
      attr_reader :clear_thinking_20251015

      sig do
        params(
          clear_thinking_20251015:
            T.nilable(Anthropic::CapabilitySupport::OrHash)
        ).void
      end
      attr_writer :clear_thinking_20251015

      # Whether the clear_tool_uses_20250919 strategy is supported.
      sig { returns(T.nilable(Anthropic::CapabilitySupport)) }
      attr_reader :clear_tool_uses_20250919

      sig do
        params(
          clear_tool_uses_20250919:
            T.nilable(Anthropic::CapabilitySupport::OrHash)
        ).void
      end
      attr_writer :clear_tool_uses_20250919

      # Whether the compact_20260112 strategy is supported.
      sig { returns(T.nilable(Anthropic::CapabilitySupport)) }
      attr_reader :compact_20260112

      sig do
        params(
          compact_20260112: T.nilable(Anthropic::CapabilitySupport::OrHash)
        ).void
      end
      attr_writer :compact_20260112

      # Whether this capability is supported by the model.
      sig { returns(T::Boolean) }
      attr_accessor :supported

      # Context management capability details.
      sig do
        params(
          clear_thinking_20251015:
            T.nilable(Anthropic::CapabilitySupport::OrHash),
          clear_tool_uses_20250919:
            T.nilable(Anthropic::CapabilitySupport::OrHash),
          compact_20260112: T.nilable(Anthropic::CapabilitySupport::OrHash),
          supported: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether the clear_thinking_20251015 strategy is supported.
        clear_thinking_20251015:,
        # Whether the clear_tool_uses_20250919 strategy is supported.
        clear_tool_uses_20250919:,
        # Whether the compact_20260112 strategy is supported.
        compact_20260112:,
        # Whether this capability is supported by the model.
        supported:
      )
      end

      sig do
        override.returns(
          {
            clear_thinking_20251015: T.nilable(Anthropic::CapabilitySupport),
            clear_tool_uses_20250919: T.nilable(Anthropic::CapabilitySupport),
            compact_20260112: T.nilable(Anthropic::CapabilitySupport),
            supported: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
