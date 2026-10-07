# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingTypes < Anthropic::Internal::Type::BaseModel
      # @!attribute adaptive
      #   Whether the model accepts thinking with type 'adaptive' (the model decides
      #   whether and how much to think).
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :adaptive, -> { Anthropic::CapabilitySupport }

      # @!attribute disabled
      #   Whether the model accepts thinking with type 'disabled' (thinking turned off).
      #   False exactly when a request that sends it gets a 400 from this model. True on a
      #   model that does not support thinking.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :disabled, -> { Anthropic::CapabilitySupport }

      # @!attribute enabled
      #   Whether the model accepts thinking with type 'enabled' (extended thinking with a
      #   caller-set `budget_tokens`).
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :enabled, -> { Anthropic::CapabilitySupport }

      # @!method initialize(adaptive:, disabled:, enabled:)
      #   Which `thinking.type` values the model accepts on requests. Read each key on its
      #   own: for example, `enabled` can be false while `disabled` is true.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ThinkingTypes} for more details.
      #
      #   @param adaptive [Anthropic::Models::CapabilitySupport] Whether the model accepts thinking with type 'adaptive' (the model decides wheth
      #
      #   @param disabled [Anthropic::Models::CapabilitySupport] Whether the model accepts thinking with type 'disabled' (thinking turned off). F
      #
      #   @param enabled [Anthropic::Models::CapabilitySupport] Whether the model accepts thinking with type 'enabled' (extended thinking with a
    end
  end
end
