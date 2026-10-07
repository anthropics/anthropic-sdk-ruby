# typed: strong

module Anthropic
  module Models
    BetaComputerKeyInput = Beta::BetaComputerKeyInput

    module Beta
      class BetaComputerKeyInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaComputerKeyInput,
              Anthropic::Internal::AnyHash
            )
          end

        # The key or key-combination to press.
        sig { returns(String) }
        attr_accessor :text

        # Number of times to repeat the key press. Default is 1.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :repeat

        # Press a key or key-combination on the keyboard. Use "+" to combine modifiers
        # with a key (e.g. "ctrl+s", "alt+Tab", "ctrl+shift+Escape"). Key names are
        # case-insensitive; common names like "Return", "Tab", "Escape", "Up", "Down",
        # "Left", "Right", "Home", "End", "Page_Up", "Page_Down", "Delete", "BackSpace"
        # are supported.
        sig do
          params(text: String, repeat: T.nilable(Integer)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The key or key-combination to press.
          text:,
          # Number of times to repeat the key press. Default is 1.
          repeat: nil
        )
        end

        sig { override.returns({ text: String, repeat: T.nilable(Integer) }) }
        def to_hash
        end
      end
    end
  end
end
