# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeltaEvent = Beta::BetaManagedAgentsDeltaEvent

    module Beta
      class BetaManagedAgentsDeltaEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeltaEvent,
              Anthropic::Internal::AnyHash
            )
          end

        # One fragment of the previewed event. The delta type is named for the previewed
        # event's field it streams into: agent.message events stream content_delta
        # fragments, each a partial element of the content array.
        sig { returns(Anthropic::Beta::BetaManagedAgentsDeltaContent) }
        attr_reader :delta

        sig do
          params(
            delta: Anthropic::Beta::BetaManagedAgentsDeltaContent::OrHash
          ).void
        end
        attr_writer :delta

        # The id of the event being previewed. Matches event.id on the corresponding
        # event_start and the buffered event that reconciles the preview.
        sig { returns(String) }
        attr_accessor :event_id

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeltaEvent::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # An incremental update to an event that is still being streamed. Deltas are
        # best-effort and may stop early; when the buffered event with id == event_id is
        # produced it carries the complete content. A model request that ends early (an
        # error or interrupt) produces no buffered event — its terminal
        # span.model_request_end closes the preview. Only sent on stream connections that
        # opt in via event_deltas; never appears in event history.
        sig do
          params(
            delta: Anthropic::Beta::BetaManagedAgentsDeltaContent::OrHash,
            event_id: String,
            type: Anthropic::Beta::BetaManagedAgentsDeltaEvent::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # One fragment of the previewed event. The delta type is named for the previewed
          # event's field it streams into: agent.message events stream content_delta
          # fragments, each a partial element of the content array.
          delta:,
          # The id of the event being previewed. Matches event.id on the corresponding
          # event_start and the buffered event that reconciles the preview.
          event_id:,
          type:
        )
        end

        sig do
          override.returns(
            {
              delta: Anthropic::Beta::BetaManagedAgentsDeltaContent,
              event_id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsDeltaEvent::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsDeltaEvent::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EVENT_DELTA =
            T.let(
              :event_delta,
              Anthropic::Beta::BetaManagedAgentsDeltaEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeltaEvent::Type::TaggedSymbol
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
