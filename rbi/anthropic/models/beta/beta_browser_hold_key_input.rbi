# typed: strong

module Anthropic
  module Models
    BetaBrowserHoldKeyInput = Beta::BetaBrowserHoldKeyInput

    module Beta
      class BetaBrowserHoldKeyInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserHoldKeyInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Seconds to hold the key down (maximum 30).
        sig { returns(Float) }
        attr_accessor :duration

        # The key or chord to hold.
        sig { returns(String) }
        attr_accessor :text

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Hold a key or key chord down for a duration, then release it. Uses the same key
        # names and "+" chord syntax as the key action.
        sig do
          params(
            duration: Float,
            text: String,
            tab_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Seconds to hold the key down (maximum 30).
          duration:,
          # The key or chord to hold.
          text:,
          # Tab to act on. Defaults to the active tab when omitted.
          tab_id: nil
        )
        end

        sig do
          override.returns(
            { duration: Float, text: String, tab_id: T.nilable(String) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
