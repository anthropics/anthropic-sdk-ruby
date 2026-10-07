# typed: strong

module Anthropic
  module Models
    BetaBrowserListTabsInput = Beta::BetaBrowserListTabsInput

    module Beta
      class BetaBrowserListTabsInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserListTabsInput,
              Anthropic::Internal::AnyHash
            )
          end

        # List all open tabs with each tab's tab_id, title, and URL.
        sig { returns(T.attached_class) }
        def self.new
        end

        sig { override.returns({}) }
        def to_hash
        end
      end
    end
  end
end
