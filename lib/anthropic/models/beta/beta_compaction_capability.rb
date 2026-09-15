# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCompactionCapability < Anthropic::Internal::Type::BaseModel
        # @!attribute summarize
        #   Whether the summarize compaction type is supported.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :summarize, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute supported
        #   Whether this capability is supported by the model.
        #
        #   @return [Boolean]
        required :supported, Anthropic::Internal::Type::Boolean

        # @!method initialize(summarize:, supported:)
        #   Compaction capability details: whether the model accepts the top-level
        #   `compaction` request parameter, with one entry per supported `compaction.type`
        #   value.
        #
        #   @param summarize [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the summarize compaction type is supported.
        #
        #   @param supported [Boolean] Whether this capability is supported by the model.
      end
    end

    BetaCompactionCapability = Beta::BetaCompactionCapability
  end
end
