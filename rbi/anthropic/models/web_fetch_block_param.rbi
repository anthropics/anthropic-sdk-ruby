# typed: strong

module Anthropic
  module Models
    class WebFetchBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::WebFetchBlockParam, Anthropic::Internal::AnyHash)
        end

      sig { returns(Anthropic::DocumentBlockParam) }
      attr_reader :content

      sig { params(content: Anthropic::DocumentBlockParam::OrHash).void }
      attr_writer :content

      sig { returns(Symbol) }
      attr_accessor :type

      # Fetched content URL
      sig { returns(String) }
      attr_accessor :url

      # ISO 8601 timestamp when the content was retrieved
      sig { returns(T.nilable(String)) }
      attr_accessor :retrieved_at

      sig do
        params(
          content: Anthropic::DocumentBlockParam::OrHash,
          url: String,
          retrieved_at: T.nilable(String),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        content:,
        # Fetched content URL
        url:,
        # ISO 8601 timestamp when the content was retrieved
        retrieved_at: nil,
        type: :web_fetch_result
      )
      end

      sig do
        override.returns(
          {
            content: Anthropic::DocumentBlockParam,
            type: Symbol,
            url: String,
            retrieved_at: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
