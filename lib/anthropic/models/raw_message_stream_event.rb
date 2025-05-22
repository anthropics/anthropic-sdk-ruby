# frozen_string_literal: true

module Anthropic
  module Models
    module RawMessageStreamEvent
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :message_start, -> { Anthropic::RawMessageStartEvent }

      variant :message_delta, -> { Anthropic::RawMessageDeltaEvent }

      variant :message_stop, -> { Anthropic::RawMessageStopEvent }

      variant :content_block_start, -> { Anthropic::RawContentBlockStartEvent }

      variant :content_block_delta, -> { Anthropic::RawContentBlockDeltaEvent }

      variant :content_block_stop, -> { Anthropic::RawContentBlockStopEvent }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::RawMessageStartEvent, Anthropic::Models::RawMessageDeltaEvent, Anthropic::Models::RawMessageStopEvent, Anthropic::Models::RawContentBlockStartEvent, Anthropic::Models::RawContentBlockDeltaEvent, Anthropic::Models::RawContentBlockStopEvent)]
    end
  end
end
