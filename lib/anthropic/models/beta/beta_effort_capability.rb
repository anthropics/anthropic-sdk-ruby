# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaEffortCapability < Anthropic::Internal::Type::BaseModel
        # @!attribute high
        #   Whether the model supports high effort level.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :high, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute low
        #   Whether the model supports low effort level.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :low, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute max
        #   Whether the model supports max effort level.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :max, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute medium
        #   Whether the model supports medium effort level.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :medium, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute supported
        #   Whether this capability is supported by the model.
        #
        #   @return [Boolean]
        required :supported, Anthropic::Internal::Type::Boolean

        # @!method initialize(high:, low:, max:, medium:, supported:)
        #   Effort (reasoning_effort) capability details.
        #
        #   @param high [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model supports high effort level.
        #
        #   @param low [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model supports low effort level.
        #
        #   @param max [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model supports max effort level.
        #
        #   @param medium [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model supports medium effort level.
        #
        #   @param supported [Boolean] Whether this capability is supported by the model.
      end
    end

    BetaEffortCapability = Beta::BetaEffortCapability
  end
end
