# typed: strong

module Anthropic
  module Resources
    class Beta
      class Sessions
        class Threads
          class Events
            # List Session Thread Events
            sig do
              params(
                thread_id: String,
                session_id: String,
                limit: Integer,
                page: String,
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
              # Path param: Path parameter thread_id
              thread_id,
              # Path param: Path parameter session_id
              session_id:,
              # Query param: Query parameter for limit
              limit: nil,
              # Query param: Query parameter for page
              page: nil,
              # Header param: Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            # Stream Session Thread Events
            sig do
              params(
                thread_id: String,
                session_id: String,
                event_deltas:
                  T::Array[
                    Anthropic::Beta::BetaManagedAgentsDeltaType::OrSymbol
                  ],
                betas:
                  T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::Stream[
                  Anthropic::Beta::Sessions::BetaManagedAgentsStreamSessionThreadEvents::Variants
                ]
              )
            end
            def stream_events(
              # Path param: Path parameter thread_id
              thread_id,
              # Path param: Path parameter session_id
              session_id:,
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
end
