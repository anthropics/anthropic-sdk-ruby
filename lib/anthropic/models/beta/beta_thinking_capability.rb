# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingCapability < Anthropic::Internal::Type::BaseModel
        # @!attribute supported
        #   Whether this capability is supported by the model.
        #
        #   @return [Boolean]
        required :supported, Anthropic::Internal::Type::Boolean

        # @!attribute types
        #   Supported thinking type configurations.
        #
        #   @return [Anthropic::Models::Beta::BetaThinkingTypes]
        required :types, -> { Anthropic::Beta::BetaThinkingTypes }

        # @!method initialize(supported:, types:)
        #   Thinking capability details.
        #
        #   @param supported [Boolean] Whether this capability is supported by the model.
        #
        #   @param types [Anthropic::Models::Beta::BetaThinkingTypes] Supported thinking type configurations.
      end
    end

    BetaThinkingCapability = Beta::BetaThinkingCapability
  end
end
