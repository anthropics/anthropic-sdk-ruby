# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @abstract
      #
      # @example
      # ```ruby
      # case beta_raw_message_stream_event
      # in {type: "message_start", message: Anthropic::Models::Beta::BetaMessage}
      #   # Anthropic::Models::Beta::BetaRawMessageStartEvent ...
      # in {
      #   type: "message_delta",
      #   delta: Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta,
      #   usage: Anthropic::Models::Beta::BetaMessageDeltaUsage
      # }
      #   # Anthropic::Models::Beta::BetaRawMessageDeltaEvent ...
      # in {type: "message_stop"}
      #   # Anthropic::Models::Beta::BetaRawMessageStopEvent ...
      # in {
      #   type: "content_block_start",
      #   content_block: Anthropic::Models::Beta::BetaRawContentBlockStartEvent::ContentBlock,
      #   index: Integer
      # }
      #   # Anthropic::Models::Beta::BetaRawContentBlockStartEvent ...
      # in {
      #   type: "content_block_delta",
      #   delta: Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent::Delta,
      #   index: Integer
      # }
      #   # Anthropic::Models::Beta::BetaRawContentBlockDeltaEvent ...
      # in {type: "content_block_stop", index: Integer}
      #   # Anthropic::Models::Beta::BetaRawContentBlockStopEvent ...
      # end
      # ```
      #
      # @example
      # ```ruby
      # case beta_raw_message_stream_event
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
