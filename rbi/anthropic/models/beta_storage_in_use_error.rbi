# typed: strong

module Anthropic
  module Models
    # The bucket is already in use, or was in use recently. Name a different bucket.
    class BetaStorageInUseError < Anthropic::Errors::ConflictError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::BetaStorageInUseErrorDetails) }
      def details
      end
    end
  end
end
