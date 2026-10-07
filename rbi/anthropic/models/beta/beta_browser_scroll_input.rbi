# typed: strong

module Anthropic
  module Models
    BetaBrowserScrollInput = Beta::BetaBrowserScrollInput

    module Beta
      class BetaBrowserScrollInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserScrollInput,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(Anthropic::Beta::BetaBrowserScrollDirection::TaggedSymbol)
        end
        attr_accessor :scroll_direction

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

        # Scroll-wheel notches (1–10). Default 3.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :scroll_amount

        # Tab to act on. Defaults to the active tab when omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :tab_id

        # Scroll at a viewport position. `target` must be a coordinate target.
        sig do
          params(
            scroll_direction:
              Anthropic::Beta::BetaBrowserScrollDirection::OrSymbol,
            target: Anthropic::Beta::BetaBrowserCoordinateTarget::OrHash,
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
              scroll_direction:
                Anthropic::Beta::BetaBrowserScrollDirection::TaggedSymbol,
              target: Anthropic::Beta::BetaBrowserCoordinateTarget,
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
end
