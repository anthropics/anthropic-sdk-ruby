# typed: strong

module Anthropic
  module Resources
    class Beta
      class Sessions
        class Threads
          sig { returns(Anthropic::Resources::Beta::Sessions::Threads::Events) }
          attr_reader :events

          # Get Session Thread
          sig do
            params(
              thread_id: String,
              session_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread)
          end
          def retrieve(
            # Path param: Path parameter thread_id
            thread_id,
            # Path param: Path parameter session_id
            session_id:,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # List Session Threads
          sig do
            params(
              session_id: String,
              limit: Integer,
              page: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread
              ]
            )
          end
          def list(
            # Path param: Path parameter session_id
            session_id,
            # Query param: Maximum results per page. Defaults to 1000.
            limit: nil,
            # Query param: Opaque pagination cursor from a previous response's next_page.
            # Forward-only.
            page: nil,
            # Header param: Optional header to specify the beta version(s) you want to use.
            betas: nil,
            request_options: {}
          )
          end

          # Archive Session Thread
          sig do
            params(
              thread_id: String,
              session_id: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(Anthropic::Beta::Sessions::BetaManagedAgentsSessionThread)
          end
          def archive(
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
