# typed: strong

module Anthropic
  module Models
    # The `compaction` block's `tool_changes` differs from what was returned with the
    # block.
    class CompactionToolChangesMismatchError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CompactionToolChangesMismatchErrorDetails) }
      def details
      end
    end
  end
end
