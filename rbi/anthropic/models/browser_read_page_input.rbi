# typed: strong

module Anthropic
  module Models
    class BrowserReadPageInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BrowserReadPageInput, Anthropic::Internal::AnyHash)
        end

      # Maximum tree depth. Default 15.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :depth

      # Which elements to include. Omitted: every visible element. "interactive":
      # interactive elements only. "all": additionally includes off-viewport elements.
      sig { returns(T.nilable(Anthropic::BrowserReadPageFilter::TaggedSymbol)) }
      attr_accessor :filter

      # Element reference to read a subtree from. Omit to read from the page root.
      sig { returns(T.nilable(String)) }
      attr_accessor :ref

      # Tab to act on. Defaults to the active tab when omitted.
      sig { returns(T.nilable(String)) }
      attr_accessor :tab_id

      # Return a structured accessibility tree of the page (or the subtree rooted at
      # `ref`), with element references like [ref_7] that can be used as targets on
      # later actions. Output is capped at 50,000 characters — narrow with `ref` or a
      # smaller `depth` when exceeded.
      sig do
        params(
          depth: T.nilable(Integer),
          filter: T.nilable(Anthropic::BrowserReadPageFilter::OrSymbol),
          ref: T.nilable(String),
          tab_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Maximum tree depth. Default 15.
        depth: nil,
        # Which elements to include. Omitted: every visible element. "interactive":
        # interactive elements only. "all": additionally includes off-viewport elements.
        filter: nil,
        # Element reference to read a subtree from. Omit to read from the page root.
        ref: nil,
        # Tab to act on. Defaults to the active tab when omitted.
        tab_id: nil
      )
      end

      sig do
        override.returns(
          {
            depth: T.nilable(Integer),
            filter: T.nilable(Anthropic::BrowserReadPageFilter::TaggedSymbol),
            ref: T.nilable(String),
            tab_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
