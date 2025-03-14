# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      class BetaRawMessageStreamEvent < Anthropic::Union
        discriminator :type

        variant :message_start, -> { Anthropic::Models::Beta::BetaRawMessageStartEvent }

        variant :message_delta, -> { Anthropic::Models::Beta::BetaRawMessageDeltaEvent }

        variant :message_stop, -> { Anthropic::Models::Beta::BetaRawMessageStopEvent }

        variant :content_block_start, -> { Anthropic::Models::Beta::BetaRawContentBlockStartEvent }

        variant :content_block_delta, -> { Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent }

        variant :content_block_stop, -> { Anthropic::Models::Beta::BetaRawContentBlockStopEvent }
      end
    end

    BetaRawMessageStreamEvent = Beta::BetaRawMessageStreamEvent
  end
end
