# typed: strong

module Anthropic
  module Models
    BetaComputerScrollInput = Beta::BetaComputerScrollInput

    module Beta
      class BetaComputerScrollInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaComputerScrollInput,
              Anthropic::Internal::AnyHash
            )
          end

        # Number of 'clicks' of the scroll wheel.
        sig { returns(Integer) }
        attr_accessor :scroll_amount

        sig do
          returns(Anthropic::Beta::BetaComputerScrollDirection::TaggedSymbol)
        end
        attr_accessor :scroll_direction

        # (x, y): x pixels from the left edge, y pixels from the top edge.
        sig { returns(T.nilable(T::Array[Integer])) }
        attr_accessor :coordinate

        # Optional key combination to hold down during this action (e.g. "ctrl", "shift",
        # "ctrl+shift").
        sig { returns(T.nilable(String)) }
        attr_accessor :text

        # Scroll the screen at the specified (x, y) pixel coordinate, or the current
        # cursor position if `coordinate` is omitted. Do NOT use PageUp/PageDown to
        # scroll.
        sig do
          params(
            scroll_amount: Integer,
            scroll_direction:
              Anthropic::Beta::BetaComputerScrollDirection::OrSymbol,
            coordinate: T.nilable(T::Array[Integer]),
            text: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of 'clicks' of the scroll wheel.
          scroll_amount:,
          scroll_direction:,
          # (x, y): x pixels from the left edge, y pixels from the top edge.
          coordinate: nil,
          # Optional key combination to hold down during this action (e.g. "ctrl", "shift",
          # "ctrl+shift").
          text: nil
        )
        end

        sig do
          override.returns(
            {
              scroll_amount: Integer,
              scroll_direction:
                Anthropic::Beta::BetaComputerScrollDirection::TaggedSymbol,
              coordinate: T.nilable(T::Array[Integer]),
              text: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
