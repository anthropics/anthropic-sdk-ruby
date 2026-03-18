# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingCapability < Anthropic::Internal::Type::BaseModel
      # @!attribute supported
      #   Whether this capability is supported by the model.
      #
      #   @return [Boolean]
      required :supported, Anthropic::Internal::Type::Boolean

      # @!attribute types
      #   Supported thinking type configurations.
      #
      #   @return [Anthropic::Models::ThinkingTypes]
      required :types, -> { Anthropic::ThinkingTypes }

      # @!method initialize(supported:, types:)
      #   Thinking capability details.
      #
      #   @param supported [Boolean] Whether this capability is supported by the model.
      #
      #   @param types [Anthropic::Models::ThinkingTypes] Supported thinking type configurations.
    end
  end
end
