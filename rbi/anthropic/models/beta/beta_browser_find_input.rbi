# typed: strong

module Anthropic
  module Models
    BetaBrowserFindInput = Beta::BetaBrowserFindInput

    module Beta
      class BetaBrowserFindInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserFindInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Natural-language description of the element(s) to find.
        sig { returns(String) }
        attr_accessor :query

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Find elements matching a natural-language description (e.g. "search bar", "add
        # to cart button") and return up to 20 matches with element references.
        sig do
          params(query: String, tab_id: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # Natural-language description of the element(s) to find.
          query:,
          # Tab to act on. Defaults to the active tab when omitted.
          tab_id: nil
        )
        end

        sig { override.returns({ query: String, tab_id: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end
