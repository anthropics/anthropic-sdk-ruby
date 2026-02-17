# typed: strong

module Anthropic
  module Models
    class WebFetchBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::WebFetchBlock, Anthropic::Internal::AnyHash)
        end

      sig { returns(Anthropic::DocumentBlock) }
      attr_reader :content

      sig { params(content: Anthropic::DocumentBlock::OrHash).void }
      attr_writer :content

      # ISO 8601 timestamp when the content was retrieved
      sig { returns(T.nilable(String)) }
      attr_accessor :retrieved_at

      sig { returns(Symbol) }
      attr_accessor :type

      # Fetched content URL
      sig { returns(String) }
      attr_accessor :url

      sig do
        params(
          content: Anthropic::DocumentBlock::OrHash,
          retrieved_at: T.nilable(String),
          url: String,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        content:,
        # ISO 8601 timestamp when the content was retrieved
        retrieved_at:,
        # Fetched content URL
        url:,
        type: :web_fetch_result
      )
      end

      sig do
        override.returns(
          {
            content: Anthropic::DocumentBlock,
            retrieved_at: T.nilable(String),
            type: Symbol,
            url: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
