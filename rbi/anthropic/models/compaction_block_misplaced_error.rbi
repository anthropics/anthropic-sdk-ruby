# typed: strong

module Anthropic
  module Models
    # The `compaction` block is not the first block of the conversation, or is in a
    # `system` message.
    class CompactionBlockMisplacedError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CompactionBlockMisplacedErrorDetails) }
      def details
      end
    end
  end
end
