# typed: strong

module Anthropic
  module Models
    class BrowserKeyInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BrowserKeyInput, Anthropic::Internal::AnyHash)
        end

      # The key, chord, or space-separated sequence to press.
      sig { returns(String) }
      attr_accessor :text

      # Number of times to repeat. Default 1.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :repeat

      # Tab to act on. Defaults to the active tab when omitted.
      sig { returns(T.nilable(String)) }
      attr_accessor :tab_id

      # Press a key or key chord. Use "+" to combine modifiers with a key (e.g.
      # "ctrl+a", "cmd+shift+p") and space to sequence presses (e.g. "Backspace
      # Backspace Delete"). Common names like "Return", "Tab", "Escape", "BackSpace" are
      # supported.
      sig do
        params(
          text: String,
          repeat: T.nilable(Integer),
          tab_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # The key, chord, or space-separated sequence to press.
        text:,
        # Number of times to repeat. Default 1.
        repeat: nil,
        # Tab to act on. Defaults to the active tab when omitted.
        tab_id: nil
      )
      end

      sig do
        override.returns(
          {
            text: String,
            repeat: T.nilable(Integer),
            tab_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
