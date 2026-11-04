# typed: strong

module Anthropic
  module Models
    # The `compaction` block's `signature` does not verify.
    class CompactionSignatureInvalidError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CompactionSignatureInvalidErrorDetails) }
      def details
      end
    end
  end
end
