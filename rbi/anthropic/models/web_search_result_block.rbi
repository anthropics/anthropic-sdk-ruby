# typed: strong

module Anthropic
  module Models
    class WebSearchResultBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::WebSearchResultBlock, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :encrypted_content

      sig { returns(T.nilable(String)) }
      attr_accessor :page_age

      sig { returns(String) }
      attr_accessor :title

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(String) }
      attr_accessor :url

      sig do
        params(
          encrypted_content: String,
          page_age: T.nilable(String),
          title: String,
          url: String,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        encrypted_content:,
        page_age:,
        title:,
        url:,
        type: :web_search_result
      )
      end

      sig do
        override.returns(
          {
            encrypted_content: String,
            page_age: T.nilable(String),
            title: String,
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
