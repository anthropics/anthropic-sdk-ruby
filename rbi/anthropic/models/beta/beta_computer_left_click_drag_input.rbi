# typed: strong

module Anthropic
  module Models
    BetaComputerLeftClickDragInput = Beta::BetaComputerLeftClickDragInput

    module Beta
      class BetaComputerLeftClickDragInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaComputerLeftClickDragInput,
              Anthropic::Internal::AnyHash
            )
          end

        # (x, y): x pixels from the left edge, y pixels from the top edge.
        sig { returns(T::Array[Integer]) }
        attr_accessor :coordinate

        # (x, y): x pixels from the left edge, y pixels from the top edge.
        sig { returns(T::Array[Integer]) }
        attr_accessor :start_coordinate

        # Optional key combination to hold down during this action (e.g. "ctrl", "shift",
        # "ctrl+shift").
        sig { returns(T.nilable(String)) }
        attr_accessor :text

        # Click and drag the cursor from `start_coordinate` to `coordinate`.
        sig do
          params(
            coordinate: T::Array[Integer],
            start_coordinate: T::Array[Integer],
            text: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # (x, y): x pixels from the left edge, y pixels from the top edge.
          coordinate:,
          # (x, y): x pixels from the left edge, y pixels from the top edge.
          start_coordinate:,
          # Optional key combination to hold down during this action (e.g. "ctrl", "shift",
          # "ctrl+shift").
          text: nil
        )
        end

        sig do
          override.returns(
            {
              coordinate: T::Array[Integer],
              start_coordinate: T::Array[Integer],
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
