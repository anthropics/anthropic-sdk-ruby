# typed: strong

module Anthropic
  module Models
    class ComputerTypeInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ComputerTypeInput, Anthropic::Internal::AnyHash)
        end

      # The text to type.
      sig { returns(String) }
      attr_accessor :text

      # Type a string of text on the keyboard.
      sig { params(text: String).returns(T.attached_class) }
      def self.new(
        # The text to type.
        text:
      )
      end

      sig { override.returns({ text: String }) }
      def to_hash
      end
    end
  end
end
