# typed: strong

module Anthropic
  module Models
    class BrowserGetPageTextInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BrowserGetPageTextInput,
            Anthropic::Internal::AnyHash
          )
        end

      # Tab to act on. Defaults to the active tab when omitted.
      sig { returns(T.nilable(String)) }
      attr_accessor :tab_id

      # Return the page's visible text content as plain text, prioritizing article
      # content. Suited to articles, documentation, and other text-heavy pages.
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
