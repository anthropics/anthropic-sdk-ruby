# typed: strong

module Anthropic
  module Models
    class BrowserScrollInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BrowserScrollInput, Anthropic::Internal::AnyHash)
        end

      sig { returns(Anthropic::BrowserScrollDirection::TaggedSymbol) }
      attr_accessor :scroll_direction

      # A point in the browser viewport, in viewport pixels (the same frame as a
      # full-viewport screenshot).
      sig { returns(Anthropic::BrowserCoordinateTarget) }
      attr_reader :target

      sig { params(target: Anthropic::BrowserCoordinateTarget::OrHash).void }
      attr_writer :target

      # Scroll-wheel notches (1–10). Default 3.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :scroll_amount

      # Tab to act on. Defaults to the active tab when omitted.
      sig { returns(T.nilable(String)) }
      attr_accessor :tab_id

      # Scroll at a viewport position. `target` must be a coordinate target.
      sig do
        params(
          scroll_direction: Anthropic::BrowserScrollDirection::OrSymbol,
          target: Anthropic::BrowserCoordinateTarget::OrHash,
          scroll_amount: T.nilable(Integer),
          tab_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        scroll_direction:,
        # A point in the browser viewport, in viewport pixels (the same frame as a
        # full-viewport screenshot).
        target:,
        # Scroll-wheel notches (1–10). Default 3.
        scroll_amount: nil,
        # Tab to act on. Defaults to the active tab when omitted.
        tab_id: nil
      )
      end

      sig do
        override.returns(
          {
            scroll_direction: Anthropic::BrowserScrollDirection::TaggedSymbol,
            target: Anthropic::BrowserCoordinateTarget,
            scroll_amount: T.nilable(Integer),
            tab_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
