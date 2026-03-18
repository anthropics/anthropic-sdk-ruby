# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingTypes < Anthropic::Internal::Type::BaseModel
        # @!attribute adaptive
        #   Whether the model supports thinking with type 'adaptive' (auto).
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :adaptive, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute enabled
        #   Whether the model supports thinking with type 'enabled'.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :enabled, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!method initialize(adaptive:, enabled:)
        #   Supported thinking type configurations.
        #
        #   @param adaptive [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model supports thinking with type 'adaptive' (auto).
        #
        #   @param enabled [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model supports thinking with type 'enabled'.
      end
    end

    BetaThinkingTypes = Beta::BetaThinkingTypes
  end
end
