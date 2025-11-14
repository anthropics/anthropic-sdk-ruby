# typed: strong

module Anthropic
  module Helpers
    module Streaming
      RawMessageEvent =
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

      StreamEvent =
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

      class MessageStream
        include Anthropic::Internal::Type::BaseStream

        Message =
          type_member(:in) { { fixed: Anthropic::Streaming::RawMessageEvent } }
        Elem =
          type_member(:out) { { fixed: Anthropic::Streaming::StreamEvent } }

        sig do
          params(raw_stream: Anthropic::Internal::Stream[RawMessageEvent]).void
        end
        def initialize(raw_stream:)
        end

        sig { void }
        def until_done
        end

        sig { returns(T::Enumerator[String]) }
        def text
        end

        sig do
          returns(
            T.any(
              Anthropic::Models::Message,
              Anthropic::Models::Beta::BetaMessage
            )
          )
        end
        def accumulated_message
        end

        sig { returns(String) }
        def accumulated_text
        end

        sig do
          params(
            event: Anthropic::Streaming::RawMessageEvent,
            current_snapshot: T.nilable(Anthropic::Models::Message)
          ).returns(Anthropic::Models::Message)
        end
        private def accumulate_event(event:, current_snapshot:)
        end
      end
    end
  end
end
