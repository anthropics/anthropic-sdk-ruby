# typed: strong

module Anthropic
  module Models
    BetaBrowserSwitchTabInput = Beta::BetaBrowserSwitchTabInput

    module Beta
      class BetaBrowserSwitchTabInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserSwitchTabInput,
              Anthropic::Internal::AnyHash
            )
          end

        # The tab to switch to.
        sig { returns(String) }
        attr_accessor :tab_id

        # Make the tab with the given tab_id the active tab — the tab that actions without
        # a tab_id apply to.
        sig { params(tab_id: String).returns(T.attached_class) }
        def self.new(
          # The tab to switch to.
          tab_id:
        )
        end

        sig { override.returns({ tab_id: String }) }
        def to_hash
        end
      end
    end
  end
end
