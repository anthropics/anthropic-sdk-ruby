# typed: strong

module Anthropic
  module Models
    BetaBrowserMouseMoveInput = Beta::BetaBrowserMouseMoveInput

    module Beta
      class BetaBrowserMouseMoveInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserMouseMoveInput,
              Anthropic::Internal::AnyHash
            )
          end

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

        # Move the pointer to a viewport coordinate without clicking.
        sig do
          params(
            target: Anthropic::Beta::BetaBrowserCoordinateTarget::OrHash,
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
