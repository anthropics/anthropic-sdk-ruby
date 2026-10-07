# typed: strong

module Anthropic
  module Models
    BetaBrowserNavigateInput = Beta::BetaBrowserNavigateInput

    module Beta
      class BetaBrowserNavigateInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserNavigateInput,
              Anthropic::Internal::AnyHash
            )
          end

        # The URL to navigate to, or "back" / "forward" / "reload" for history navigation.
        sig { returns(String) }
        attr_accessor :url

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Navigate to a URL, or go back/forward/reload in history. The protocol may be
        # omitted (defaults to https://).
        sig do
          params(url: String, tab_id: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The URL to navigate to, or "back" / "forward" / "reload" for history navigation.
          url:,
          # Tab to act on. Defaults to the active tab when omitted.
          tab_id: nil
        )
        end

        sig { override.returns({ url: String, tab_id: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end
