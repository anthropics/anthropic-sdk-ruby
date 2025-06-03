# frozen_string_literal: true

module Anthropic
  module Helpers
    module Streaming
      extend Anthropic::Internal::Util::SorbetRuntimeSupport

      define_sorbet_constant!(:RawMessageEvent) do
        T.type_alias do
          T.any(
            Anthropic::Models::RawMessageStartEvent,
            Anthropic::Models::RawMessageDeltaEvent,
            Anthropic::Models::RawMessageStopEvent,
            Anthropic::Models::RawContentBlockStartEvent,
            Anthropic::Models::RawContentBlockDeltaEvent,
            Anthropic::Models::RawContentBlockStopEvent
          )
        end
      end

      define_sorbet_constant!(:StreamEvent) do
        T.type_alias do
          T.any(
            Anthropic::Streaming::RawMessageEvent,
            Anthropic::Streaming::TextEvent,
            Anthropic::Streaming::CitationEvent,
            Anthropic::Streaming::ThinkingEvent,
            Anthropic::Streaming::SignatureEvent,
            Anthropic::Streaming::InputJsonEvent,
            Anthropic::Streaming::MessageStopEvent,
            Anthropic::Streaming::ContentBlockStopEvent
          )
        end
      end
    end
  end
end
