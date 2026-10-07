# typed: strong

module Anthropic
  module Models
    class BrowserLeftMouseDownInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::BrowserLeftMouseDownInput,
            Anthropic::Internal::AnyHash
          )
        end

      # A point in the browser viewport, in viewport pixels (the same frame as a
      # full-viewport screenshot).
      sig { returns(Anthropic::BrowserCoordinateTarget) }
      attr_reader :target

      sig { params(target: Anthropic::BrowserCoordinateTarget::OrHash).void }
      attr_writer :target

      # Tab to act on. Defaults to the active tab when omitted.
      sig { returns(T.nilable(String)) }
      attr_accessor :tab_id

      # Press and hold the left mouse button at a viewport coordinate. Pair with
      # left_mouse_up to perform a custom drag.
      sig do
        params(
          target: Anthropic::BrowserCoordinateTarget::OrHash,
          tab_id: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # A point in the browser viewport, in viewport pixels (the same frame as a
        # full-viewport screenshot).
        target:,
        # Tab to act on. Defaults to the active tab when omitted.
        tab_id: nil
      )
      end

      sig do
        override.returns(
          {
            target: Anthropic::BrowserCoordinateTarget,
            tab_id: T.nilable(String)
          }
        )
      end
      def to_hash
      end
    end
  end
end
