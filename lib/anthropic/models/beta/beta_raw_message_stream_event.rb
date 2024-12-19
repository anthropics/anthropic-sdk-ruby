# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      #
      # ```ruby
      # case union
      # in Anthropic::Models::Beta::BetaRawMessageStartEvent
      #   # ...
      # in Anthropic::Models::Beta::BetaRawMessageDeltaEvent
      #   # ...
      # in Anthropic::Models::Beta::BetaRawMessageStopEvent
      #   # ...
      # in Anthropic::Models::Beta::BetaRawContentBlockStartEvent
      #   # ...
      # in Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent
      #   # ...
      # in Anthropic::Models::Beta::BetaRawContentBlockStopEvent
      #   # ...
      # end
      # ```
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
