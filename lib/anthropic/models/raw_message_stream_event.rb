# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # case raw_message_stream_event
    # in {type: "message_start", message: Anthropic::Models::Message, type: enum: Anthropic::Models::RawMessageStartEvent::Type}
    #   # Anthropic::Models::RawMessageStartEvent ...
    # in {type: "message_delta", delta: Anthropic::Models::RawMessageDeltaEvent::Delta, type: enum: Anthropic::Models::RawMessageDeltaEvent::Type, usage: Anthropic::Models::MessageDeltaUsage}
    #   # Anthropic::Models::RawMessageDeltaEvent ...
    # in {type: "message_stop", type: enum: Anthropic::Models::RawMessageStopEvent::Type}
    #   # Anthropic::Models::RawMessageStopEvent ...
    # in {type: "content_block_start", content_block: union: Anthropic::Models::RawContentBlockStartEvent::ContentBlock, index: Integer, type: enum: Anthropic::Models::RawContentBlockStartEvent::Type}
    #   # Anthropic::Models::RawContentBlockStartEvent ...
    # in {type: "content_block_delta", delta: union: Anthropic::Models::RawContentBlockDeltaEvent::Delta, index: Integer, type: enum: Anthropic::Models::RawContentBlockDeltaEvent::Type}
    #   # Anthropic::Models::RawContentBlockDeltaEvent ...
    # in {type: "content_block_stop", index: Integer, type: enum: Anthropic::Models::RawContentBlockStopEvent::Type}
    #   # Anthropic::Models::RawContentBlockStopEvent ...
    # end
    # ```
    #
    # @example
    #
    # ```ruby
    # case raw_message_stream_event
    # in Anthropic::Models::RawMessageStartEvent
    #   # ...
    # in Anthropic::Models::RawMessageDeltaEvent
    #   # ...
    # in Anthropic::Models::RawMessageStopEvent
    #   # ...
    # in Anthropic::Models::RawContentBlockStartEvent
    #   # ...
    # in Anthropic::Models::RawContentBlockDeltaEvent
    #   # ...
    # in Anthropic::Models::RawContentBlockStopEvent
    #   # ...
    # end
    # ```
    class RawMessageStreamEvent < Anthropic::Union
      discriminator :type

      variant :message_start, -> { Anthropic::Models::RawMessageStartEvent }

      variant :message_delta, -> { Anthropic::Models::RawMessageDeltaEvent }

      variant :message_stop, -> { Anthropic::Models::RawMessageStopEvent }

      variant :content_block_start, -> { Anthropic::Models::RawContentBlockStartEvent }

      variant :content_block_delta, -> { Anthropic::Models::RawContentBlockDeltaEvent }

      variant :content_block_stop, -> { Anthropic::Models::RawContentBlockStopEvent }
    end
  end
end
