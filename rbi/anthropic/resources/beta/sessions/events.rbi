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
              limit: Integer,
              order:
                Anthropic::Beta::Sessions::EventListParams::Order::OrSymbol,
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
            # Path param: Path parameter session_id
            session_id,
            # Query param: Query parameter for limit
            limit: nil,
            # Query param: Sort direction for results, ordered by created_at. Defaults to asc
            # (chronological).
            order: nil,
            # Query param: Opaque pagination cursor from a previous response's next_page.
            page: nil,
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
                    Anthropic::Beta::Sessions::BetaManagedAgentsUserCustomToolResultEventParams::OrHash
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
            # Path parameter session_id
            session_id,
            # Optional header to specify the beta version(s) you want to use.
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
