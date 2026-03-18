# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContextManagementCapability < Anthropic::Internal::Type::BaseModel
        # @!attribute clear_thinking_20251015
        #   Indicates whether a capability is supported.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport, nil]
        required :clear_thinking_20251015, -> { Anthropic::Beta::BetaCapabilitySupport }, nil?: true

        # @!attribute clear_tool_uses_20250919
        #   Indicates whether a capability is supported.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport, nil]
        required :clear_tool_uses_20250919, -> { Anthropic::Beta::BetaCapabilitySupport }, nil?: true

        # @!attribute compact_20260112
        #   Indicates whether a capability is supported.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport, nil]
        required :compact_20260112, -> { Anthropic::Beta::BetaCapabilitySupport }, nil?: true

        # @!attribute supported
        #   Whether this capability is supported by the model.
        #
        #   @return [Boolean]
        required :supported, Anthropic::Internal::Type::Boolean

        # @!method initialize(clear_thinking_20251015:, clear_tool_uses_20250919:, compact_20260112:, supported:)
        #   Context management capability details.
        #
        #   @param clear_thinking_20251015 [Anthropic::Models::Beta::BetaCapabilitySupport, nil] Indicates whether a capability is supported.
        #
        #   @param clear_tool_uses_20250919 [Anthropic::Models::Beta::BetaCapabilitySupport, nil] Indicates whether a capability is supported.
        #
        #   @param compact_20260112 [Anthropic::Models::Beta::BetaCapabilitySupport, nil] Indicates whether a capability is supported.
        #
        #   @param supported [Boolean] Whether this capability is supported by the model.
      end
    end

    BetaContextManagementCapability = Beta::BetaContextManagementCapability
  end
end
