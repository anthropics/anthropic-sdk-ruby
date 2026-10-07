# typed: strong

module Anthropic
  module Models
    BetaBrowserScreenshotInput = Beta::BetaBrowserScreenshotInput

    module Beta
      class BetaBrowserScreenshotInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserScreenshotInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Capture the current browser viewport.
        sig { params(tab_id: T.nilable(String)).returns(T.attached_class) }
        def self.new(
          # Tab to act on. Defaults to the active tab when omitted.
          tab_id: nil
        )
        end

        sig { override.returns({ tab_id: T.nilable(String) }) }
        def to_hash
        end
      end
    end
  end
end
