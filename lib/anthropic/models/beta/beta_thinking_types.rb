# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThinkingTypes < Anthropic::Internal::Type::BaseModel
        # @!attribute adaptive
        #   Whether the model accepts thinking with type 'adaptive' (the model decides
        #   whether and how much to think).
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :adaptive, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute between_tools
        #   Whether the model accepts thinking with type 'between_tools' (thinking turned
        #   off, and any short progress updates the model writes between tool calls come
        #   back as thinking blocks). False exactly when a request that sends it gets a 400
        #   from this model. A request that sends 'between_tools' can still be rejected for
        #   another reason, such as an effort level the model does not allow with thinking
        #   off.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :between_tools, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute disabled
        #   Whether the model accepts thinking with type 'disabled' (thinking turned off).
        #   False exactly when a request that sends it gets a 400 from this model. True on a
        #   model that does not support thinking. A request that sends 'disabled' can still
        #   be rejected for another reason, such as an effort level the model does not allow
        #   with thinking off.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :disabled, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute enabled
        #   Whether the model accepts thinking with type 'enabled' (extended thinking with a
        #   caller-set `budget_tokens`).
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :enabled, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!method initialize(adaptive:, between_tools:, disabled:, enabled:)
        #   Which `thinking.type` values the model accepts on requests. Read each key on its
        #   own: for example, `enabled` can be false while `disabled` is true.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaThinkingTypes} for more details.
        #
        #   @param adaptive [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model accepts thinking with type 'adaptive' (the model decides wheth
        #
        #   @param between_tools [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model accepts thinking with type 'between_tools' (thinking turned of
        #
        #   @param disabled [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model accepts thinking with type 'disabled' (thinking turned off). F
        #
        #   @param enabled [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model accepts thinking with type 'enabled' (extended thinking with a
      end
    end

    BetaThinkingTypes = Beta::BetaThinkingTypes
  end
end
