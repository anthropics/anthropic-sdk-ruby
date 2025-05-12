# typed: strong

module Anthropic
  module Models
    BetaWebSearchResultBlockParam = Beta::BetaWebSearchResultBlockParam

    module Beta
      class BetaWebSearchResultBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebSearchResultBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :encrypted_content

        sig { returns(String) }
        attr_accessor :title

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :url

        sig { returns(T.nilable(String)) }
        attr_accessor :page_age

        sig do
          params(
            encrypted_content: String,
            title: String,
            url: String,
            page_age: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          encrypted_content:,
          title:,
          url:,
          page_age: nil,
          type: :web_search_result
        )
        end

        sig do
          override.returns(
            {
              encrypted_content: String,
              title: String,
              type: Symbol,
              url: String,
              page_age: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
