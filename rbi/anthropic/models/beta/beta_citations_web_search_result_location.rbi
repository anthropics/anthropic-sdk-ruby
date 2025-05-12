# typed: strong

module Anthropic
  module Models
    BetaCitationsWebSearchResultLocation =
      Beta::BetaCitationsWebSearchResultLocation

    module Beta
      class BetaCitationsWebSearchResultLocation < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCitationsWebSearchResultLocation,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :cited_text

        sig { returns(String) }
        attr_accessor :encrypted_index

        sig { returns(T.nilable(String)) }
        attr_accessor :title

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            cited_text: String,
            encrypted_index: String,
            title: T.nilable(String),
            url: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          cited_text:,
          encrypted_index:,
          title:,
          url:,
          type: :web_search_result_location
        )
        end

        sig do
          override.returns(
            {
              cited_text: String,
              encrypted_index: String,
              title: T.nilable(String),
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
end
