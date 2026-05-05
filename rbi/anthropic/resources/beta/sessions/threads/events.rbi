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
