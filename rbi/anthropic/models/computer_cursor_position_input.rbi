# typed: strong

module Anthropic
  module Models
    class ComputerCursorPositionInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ComputerCursorPositionInput,
            Anthropic::Internal::AnyHash
          )
        end

      # Get the current (x, y) pixel coordinate of the cursor.
      sig { returns(T.attached_class) }
      def self.new
      end

      sig { override.returns({}) }
      def to_hash
      end
    end
  end
end
