# typed: strong

module Anthropic
  module Models
    class ComputerWaitInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ComputerWaitInput, Anthropic::Internal::AnyHash)
        end

      # Duration to wait, in seconds.
      sig { returns(Integer) }
      attr_accessor :duration

      # Wait for a specified duration.
      sig { params(duration: Integer).returns(T.attached_class) }
      def self.new(
        # Duration to wait, in seconds.
        duration:
      )
      end

      sig { override.returns({ duration: Integer }) }
      def to_hash
      end
    end
  end
end
