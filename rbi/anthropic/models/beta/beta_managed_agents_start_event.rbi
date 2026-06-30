# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsStartEvent = Beta::BetaManagedAgentsStartEvent

    module Beta
      class BetaManagedAgentsStartEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsStartEvent,
              Anthropic::Internal::AnyHash
            )
          end

        # The previewed event's type and id. The event type determines which delta types
        # the preview's event_delta events carry: agent.message events stream
        # content_delta fragments; agent.thinking previews are start-only — no deltas
        # follow, and the buffered agent.thinking with the same id concludes them.
        sig do
          returns(Anthropic::Beta::BetaManagedAgentsStartEventPreview::Variants)
        end
        attr_accessor :event

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsStartEvent::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Opens a preview of a buffered event. Carries the previewed event's type and id
        # only. Followed by zero or more event_delta events with the same event id,
        # normally concluded by the buffered event carrying that id. If the producing
        # model request ends without that event (an error or interrupt mid-stream), its
        # terminal span.model_request_end closes the preview. Only sent on stream
        # connections that opt in via event_deltas; never appears in event history.
        sig do
          params(
            event:
              T.any(
                Anthropic::Beta::BetaManagedAgentsAgentMessagePreview::OrHash,
                Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview::OrHash
              ),
            type: Anthropic::Beta::BetaManagedAgentsStartEvent::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The previewed event's type and id. The event type determines which delta types
          # the preview's event_delta events carry: agent.message events stream
          # content_delta fragments; agent.thinking previews are start-only — no deltas
          # follow, and the buffered agent.thinking with the same id concludes them.
          event:,
          type:
        )
        end

        sig do
          override.returns(
            {
              event:
                Anthropic::Beta::BetaManagedAgentsStartEventPreview::Variants,
              type:
                Anthropic::Beta::BetaManagedAgentsStartEvent::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsStartEvent::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EVENT_START =
            T.let(
              :event_start,
              Anthropic::Beta::BetaManagedAgentsStartEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsStartEvent::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
