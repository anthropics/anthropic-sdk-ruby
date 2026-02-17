# typed: strong

module Anthropic
  module Models
    class ServerToolUsage < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ServerToolUsage, Anthropic::Internal::AnyHash)
        end

      # The number of web fetch tool requests.
      sig { returns(Integer) }
      attr_accessor :web_fetch_requests

      # The number of web search tool requests.
      sig { returns(Integer) }
      attr_accessor :web_search_requests

      sig do
        params(
          web_fetch_requests: Integer,
          web_search_requests: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # The number of web fetch tool requests.
        web_fetch_requests:,
        # The number of web search tool requests.
        web_search_requests:
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
