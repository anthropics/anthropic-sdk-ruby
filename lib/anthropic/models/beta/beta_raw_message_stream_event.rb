# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaRawMessageStreamEvent
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :message_start, -> { Anthropic::Models::Beta::BetaRawMessageStartEvent }

        variant :message_delta, -> { Anthropic::Models::Beta::BetaRawMessageDeltaEvent }

        variant :message_stop, -> { Anthropic::Models::Beta::BetaRawMessageStopEvent }

        variant :content_block_start, -> { Anthropic::Models::Beta::BetaRawContentBlockStartEvent }

        variant :content_block_delta, -> { Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent }

        variant :content_block_stop, -> { Anthropic::Models::Beta::BetaRawContentBlockStopEvent }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaRawMessageStartEvent, Anthropic::Models::Beta::BetaRawMessageDeltaEvent, Anthropic::Models::Beta::BetaRawMessageStopEvent, Anthropic::Models::Beta::BetaRawContentBlockStartEvent, Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent, Anthropic::Models::Beta::BetaRawContentBlockStopEvent)]
      end
    end

    BetaRawMessageStreamEvent = Beta::BetaRawMessageStreamEvent
  end
end
