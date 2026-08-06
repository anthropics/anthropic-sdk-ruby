# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsServerToolUsage = Beta::BetaManagedAgentsServerToolUsage

    module Beta
      class BetaManagedAgentsServerToolUsage < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsServerToolUsage,
              Anthropic::Internal::AnyHash
            )
          end

        # Number of server-executed web fetch requests.
        sig { returns(T.nilable(Integer)) }
        attr_reader :web_fetch_requests

        sig { params(web_fetch_requests: Integer).void }
        attr_writer :web_fetch_requests

        # Number of server-executed web search requests.
        sig { returns(T.nilable(Integer)) }
        attr_reader :web_search_requests

        sig { params(web_search_requests: Integer).void }
        attr_writer :web_search_requests

        # Cumulative count of server-executed tool invocations, broken down by tool.
        sig do
          params(
            web_fetch_requests: Integer,
            web_search_requests: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of server-executed web fetch requests.
          web_fetch_requests: nil,
          # Number of server-executed web search requests.
          web_search_requests: nil
        )
        end

        sig do
          override.returns(
            { web_fetch_requests: Integer, web_search_requests: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
