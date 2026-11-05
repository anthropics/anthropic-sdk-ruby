# typed: strong

module Anthropic
  module Models
    class BetaRateLimitError < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BetaRateLimitError, Anthropic::Internal::AnyHash)
        end

      # A human-readable explanation of the error. Its wording can change, so don't
      # match on it.
      sig { returns(String) }
      attr_accessor :message

      # The broad category of the error.
      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(message: String, type: Symbol).returns(T.attached_class) }
      def self.new(
        # A human-readable explanation of the error. Its wording can change, so don't
        # match on it.
        message:,
        # The broad category of the error.
        type: :rate_limit_error
      )
      end

      sig { override.returns({ message: String, type: Symbol }) }
      def to_hash
      end
    end
  end
end
