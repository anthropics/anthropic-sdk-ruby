# typed: strong

module Anthropic
  module Models
    BetaWebFetchBlockParam = Beta::BetaWebFetchBlockParam

    module Beta
      class BetaWebFetchBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebFetchBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Anthropic::Beta::BetaRequestDocumentBlock) }
        attr_reader :content

        sig do
          params(
            content: Anthropic::Beta::BetaRequestDocumentBlock::OrHash
          ).void
        end
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
            content: Anthropic::Beta::BetaRequestDocumentBlock::OrHash,
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
              content: Anthropic::Beta::BetaRequestDocumentBlock,
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
end
