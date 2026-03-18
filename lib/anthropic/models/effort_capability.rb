# frozen_string_literal: true

module Anthropic
  module Models
    class EffortCapability < Anthropic::Internal::Type::BaseModel
      # @!attribute high
      #   Whether the model supports high effort level.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :high, -> { Anthropic::CapabilitySupport }

      # @!attribute low
      #   Whether the model supports low effort level.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :low, -> { Anthropic::CapabilitySupport }

      # @!attribute max
      #   Whether the model supports max effort level.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :max, -> { Anthropic::CapabilitySupport }

      # @!attribute medium
      #   Whether the model supports medium effort level.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :medium, -> { Anthropic::CapabilitySupport }

      # @!attribute supported
      #   Whether this capability is supported by the model.
      #
      #   @return [Boolean]
      required :supported, Anthropic::Internal::Type::Boolean

      # @!method initialize(high:, low:, max:, medium:, supported:)
      #   Effort (reasoning_effort) capability details.
      #
      #   @param high [Anthropic::Models::CapabilitySupport] Whether the model supports high effort level.
      #
      #   @param low [Anthropic::Models::CapabilitySupport] Whether the model supports low effort level.
      #
      #   @param max [Anthropic::Models::CapabilitySupport] Whether the model supports max effort level.
      #
      #   @param medium [Anthropic::Models::CapabilitySupport] Whether the model supports medium effort level.
      #
      #   @param supported [Boolean] Whether this capability is supported by the model.
    end
  end
end
