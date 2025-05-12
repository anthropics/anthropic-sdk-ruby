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
      #   @return [Array(Anthropic::RawMessageStartEvent, Anthropic::RawMessageDeltaEvent, Anthropic::RawMessageStopEvent, Anthropic::RawContentBlockStartEvent, Anthropic::RawContentBlockDeltaEvent, Anthropic::RawContentBlockStopEvent)]

      define_sorbet_constant!(:Variants) do
        T.type_alias do
          T.any(
            Anthropic::RawMessageStartEvent,
            Anthropic::RawMessageDeltaEvent,
            Anthropic::RawMessageStopEvent,
            Anthropic::RawContentBlockStartEvent,
            Anthropic::RawContentBlockDeltaEvent,
            Anthropic::RawContentBlockStopEvent
          )
        end
      end
    end
  end
end
