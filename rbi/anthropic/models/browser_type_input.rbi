# typed: strong

module Anthropic
  module Models
    class BrowserTypeInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BrowserTypeInput, Anthropic::Internal::AnyHash)
        end

      # The text to type.
      sig { returns(String) }
      attr_accessor :text

      # Tab to act on. Defaults to the active tab when omitted.
      sig { returns(T.nilable(String)) }
      attr_accessor :tab_id

      # Type a literal string at the current focus.
      sig do
        params(text: String, tab_id: T.nilable(String)).returns(
          T.attached_class
        )
      end
      def self.new(
        # The text to type.
        text:,
        # Tab to act on. Defaults to the active tab when omitted.
        tab_id: nil
      )
      end

      sig { override.returns({ text: String, tab_id: T.nilable(String) }) }
      def to_hash
      end
    end
  end
end
