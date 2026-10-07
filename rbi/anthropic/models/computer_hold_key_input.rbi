# typed: strong

module Anthropic
  module Models
    class ComputerHoldKeyInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ComputerHoldKeyInput, Anthropic::Internal::AnyHash)
        end

      # Duration to hold the key, in seconds.
      sig { returns(Integer) }
      attr_accessor :duration

      # The key or key-combination to hold.
      sig { returns(String) }
      attr_accessor :text

      # Hold down a key or key-combination for a specified duration. Uses the same key
      # syntax as `key`.
      sig { params(duration: Integer, text: String).returns(T.attached_class) }
      def self.new(
        # Duration to hold the key, in seconds.
        duration:,
        # The key or key-combination to hold.
        text:
      )
      end

      sig { override.returns({ duration: Integer, text: String }) }
      def to_hash
      end
    end
  end
end
