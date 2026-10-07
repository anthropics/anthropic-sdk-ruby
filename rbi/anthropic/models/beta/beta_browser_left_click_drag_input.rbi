# typed: strong

module Anthropic
  module Models
    BetaBrowserLeftClickDragInput = Beta::BetaBrowserLeftClickDragInput

    module Beta
      class BetaBrowserLeftClickDragInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserLeftClickDragInput,
              Anthropic::Internal::AnyHash
            )
          end

        # A point in the browser viewport, in viewport pixels (the same frame as a
        # full-viewport screenshot).
        sig { returns(Anthropic::Beta::BetaBrowserCoordinateTarget) }
        attr_reader :from

        sig do
          params(
            from: Anthropic::Beta::BetaBrowserCoordinateTarget::OrHash
          ).void
        end
        attr_writer :from

        # A point in the browser viewport, in viewport pixels (the same frame as a
        # full-viewport screenshot).
        sig { returns(Anthropic::Beta::BetaBrowserCoordinateTarget) }
        attr_reader :target

        sig do
          params(
            target: Anthropic::Beta::BetaBrowserCoordinateTarget::OrHash
          ).void
        end
        attr_writer :target

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Press at `from`, drag to `target`, release. Both must be coordinate targets.
        sig do
          params(
            from: Anthropic::Beta::BetaBrowserCoordinateTarget::OrHash,
            target: Anthropic::Beta::BetaBrowserCoordinateTarget::OrHash,
            tab_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # A point in the browser viewport, in viewport pixels (the same frame as a
          # full-viewport screenshot).
          from:,
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
              from: Anthropic::Beta::BetaBrowserCoordinateTarget,
              target: Anthropic::Beta::BetaBrowserCoordinateTarget,
              tab_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
