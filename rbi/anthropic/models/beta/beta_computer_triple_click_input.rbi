# typed: strong

module Anthropic
  module Models
    BetaComputerTripleClickInput = Beta::BetaComputerTripleClickInput

    module Beta
      class BetaComputerTripleClickInput < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaComputerTripleClickInput,
              Anthropic::Internal::AnyHash
            )
          end

        # (x, y): x pixels from the left edge, y pixels from the top edge.
        sig { returns(T.nilable(T::Array[Integer])) }
        attr_accessor :coordinate

        # Optional key combination to hold down during this action (e.g. "ctrl", "shift",
        # "ctrl+shift").
        sig { returns(T.nilable(String)) }
        attr_accessor :text

        # Triple-click the left mouse button at the specified (x, y) pixel coordinate, or
        # the current cursor position if `coordinate` is omitted.
        sig do
          params(
            coordinate: T.nilable(T::Array[Integer]),
            text: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
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
