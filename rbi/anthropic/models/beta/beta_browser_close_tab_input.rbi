# typed: strong

module Anthropic
  module Models
    BetaBrowserCloseTabInput = Beta::BetaBrowserCloseTabInput

    module Beta
      class BetaBrowserCloseTabInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserCloseTabInput,
              Anthropic::Internal::AnyHash
            )
          end

        # The tab to close.
        sig { returns(String) }
        attr_accessor :tab_id

        # Close the tab with the given tab_id.
        sig { params(tab_id: String).returns(T.attached_class) }
        def self.new(
          # The tab to close.
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
