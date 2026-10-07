# typed: strong

module Anthropic
  module Models
    class ComputerMouseMoveInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ComputerMouseMoveInput, Anthropic::Internal::AnyHash)
        end

      # (x, y): x pixels from the left edge, y pixels from the top edge.
      sig { returns(T::Array[Integer]) }
      attr_accessor :coordinate

      # Move the cursor to a specified (x, y) pixel coordinate. Use this ONLY to hover
      # without clicking; otherwise use a click action directly.
      sig { params(coordinate: T::Array[Integer]).returns(T.attached_class) }
      def self.new(
        # (x, y): x pixels from the left edge, y pixels from the top edge.
        coordinate:
      )
      end

      sig { override.returns({ coordinate: T::Array[Integer] }) }
      def to_hash
      end
    end
  end
end
