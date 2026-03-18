# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingTypes < Anthropic::Internal::Type::BaseModel
      # @!attribute adaptive
      #   Whether the model supports thinking with type 'adaptive' (auto).
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :adaptive, -> { Anthropic::CapabilitySupport }

      # @!attribute enabled
      #   Whether the model supports thinking with type 'enabled'.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :enabled, -> { Anthropic::CapabilitySupport }

      # @!method initialize(adaptive:, enabled:)
      #   Supported thinking type configurations.
      #
      #   @param adaptive [Anthropic::Models::CapabilitySupport] Whether the model supports thinking with type 'adaptive' (auto).
      #
      #   @param enabled [Anthropic::Models::CapabilitySupport] Whether the model supports thinking with type 'enabled'.
    end
  end
end
