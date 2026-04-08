# typed: strong

module Anthropic
  module Resources
    class Beta
      class Agents
        class Versions
          # List Agent Versions
          sig do
            params(
              agent_id: String,
              limit: Integer,
              page: String,
              betas:
                T::Array[T.any(String, Anthropic::AnthropicBeta::OrSymbol)],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(
              Anthropic::Internal::PageCursor[
                Anthropic::Beta::BetaManagedAgentsAgent
              ]
            )
          end
          def list(
            # Path param: Path parameter agent_id
            agent_id,
            # Query param: Maximum results per page. Default 20, maximum 100.
            limit: nil,
            # Query param: Opaque pagination cursor.
            page: nil,
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
