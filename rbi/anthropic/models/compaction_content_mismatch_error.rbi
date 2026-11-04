# typed: strong

module Anthropic
  module Models
    # The `compaction` block's `content` differs from the text its `signature`
    # recorded.
    class CompactionContentMismatchError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CompactionContentMismatchErrorDetails) }
      def details
      end
    end
  end
end
