# frozen_string_literal: true

module Anthropic
  module Models
    class ContextManagementCapability < Anthropic::Internal::Type::BaseModel
      # @!attribute clear_thinking_20251015
      #   Whether the clear_thinking_20251015 strategy is supported.
      #
      #   @return [Anthropic::Models::CapabilitySupport, nil]
      required :clear_thinking_20251015, -> { Anthropic::CapabilitySupport }, nil?: true

      # @!attribute clear_tool_uses_20250919
      #   Whether the clear_tool_uses_20250919 strategy is supported.
      #
      #   @return [Anthropic::Models::CapabilitySupport, nil]
      required :clear_tool_uses_20250919, -> { Anthropic::CapabilitySupport }, nil?: true

      # @!attribute compact_20260112
      #   Whether the compact_20260112 strategy is supported.
      #
      #   @return [Anthropic::Models::CapabilitySupport, nil]
      required :compact_20260112, -> { Anthropic::CapabilitySupport }, nil?: true

      # @!attribute supported
      #   Whether this capability is supported by the model.
      #
      #   @return [Boolean]
      required :supported, Anthropic::Internal::Type::Boolean

      # @!method initialize(clear_thinking_20251015:, clear_tool_uses_20250919:, compact_20260112:, supported:)
      #   Context management capability details.
      #
      #   @param clear_thinking_20251015 [Anthropic::Models::CapabilitySupport, nil] Whether the clear_thinking_20251015 strategy is supported.
      #
      #   @param clear_tool_uses_20250919 [Anthropic::Models::CapabilitySupport, nil] Whether the clear_tool_uses_20250919 strategy is supported.
      #
      #   @param compact_20260112 [Anthropic::Models::CapabilitySupport, nil] Whether the compact_20260112 strategy is supported.
      #
      #   @param supported [Boolean] Whether this capability is supported by the model.
    end
  end
end
