# frozen_string_literal: true

module Anthropic
  module Models
    module RawMessageStreamEvent
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :message_start, -> { Anthropic::Models::RawMessageStartEvent }

      variant :message_delta, -> { Anthropic::Models::RawMessageDeltaEvent }

      variant :message_stop, -> { Anthropic::Models::RawMessageStopEvent }

      variant :content_block_start, -> { Anthropic::Models::RawContentBlockStartEvent }

      variant :content_block_delta, -> { Anthropic::Models::RawContentBlockDeltaEvent }

      variant :content_block_stop, -> { Anthropic::Models::RawContentBlockStopEvent }

      # @!parse
      #   # @return [Array(Anthropic::Models::RawMessageStartEvent, Anthropic::Models::RawMessageDeltaEvent, Anthropic::Models::RawMessageStopEvent, Anthropic::Models::RawContentBlockStartEvent, Anthropic::Models::RawContentBlockDeltaEvent, Anthropic::Models::RawContentBlockStopEvent)]
      #   def self.variants; end
    end
  end
end
