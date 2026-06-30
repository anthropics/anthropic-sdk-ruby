# typed: strong

module Anthropic
  module Resources
    class Beta
      class Sessions
        class Events
          # List Events
          sig do
            params(
              session_id: String,
              created_at_gt: Time,
              created_at_gte: Time,
              created_at_lt: Time,
              created_at_lte: Time,
              limit: Integer,
              order:
                Anthropic::Beta::Sessions::EventListParams::Order::OrSymbol,
              page: String,
              types: T::Array[String],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionEvent::Variants
              ]
            )
          end
          def list(
            # Path param: Path parameter session_id
            session_id,
            # Query param: Return events created after this time (exclusive).
            created_at_gt: nil,
            # Query param: Return events created at or after this time (inclusive).
            created_at_gte: nil,
            # Query param: Return events created before this time (exclusive).
            created_at_lt: nil,
            # Query param: Return events created at or before this time (inclusive).
            created_at_lte: nil,
            # Query param: Query parameter for limit
            limit: nil,
            # Query param: Sort direction for results, ordered by created_at. Defaults to asc
            # (chronological).
            order: nil,
            # Query param: Opaque pagination cursor from a previous response's next_page.
            page: nil,
            # Query param: Filter by event type. Values match the `type` field on returned
            # events (for example, `user.message` or `agent.tool_use`). Omit to return all
            # event types.
            types: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Send Events
          sig do
            params(
              session_id: String,
              events:
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserInterruptEventParams::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserToolConfirmationEventParams::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserToolResultEventParams::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams::OrHash
                  )
                ],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSendSessionEvents
            )
          end
          def send_(
            # Path param: Path parameter session_id
            session_id,
            # Body param: Events to send to the `session`.
            events:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Stream Events
          sig do
            params(
              session_id: String,
              event_deltas:
                T::Array[Anthropic::Beta::BetaManagedAgentsDeltaType::OrSymbol],
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::Stream[
                Anthropic::Beta::Sessions::BetaManagedAgentsStreamSessionEvents::Variants
              ]
            )
          end
          def stream_events(
            # Path param: Path parameter session_id
            session_id,
            # Query param: When set, this connection also receives streaming deltas
            # (`event_start`, `event_delta`) while an event is being produced, before the
            # event itself arrives. Deltas are best-effort; when the final event is produced
            # it carries the complete content. A model request that ends early (an error or
            # interrupt) produces no final event — its terminal `span.model_request_end`
            # closes the preview. Accepts one or more event types to preview and may be
            # repeated: `agent.message` streams `content_delta` fragments; `agent.thinking` is
            # start-only — a signal that the agent has begun extended thinking, concluded by
            # the `agent.thinking` event itself. Only previews of the requested event types
            # are sent.
            event_deltas: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # @api private
          sig { params(client: Anthropic::Client).returns(T.attached_class) }
          def self.new(client:)
          end
        end
      end
    end
  end
end
