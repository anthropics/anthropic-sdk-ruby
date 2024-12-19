# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # case union
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
