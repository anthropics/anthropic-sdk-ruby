# typed: strong

module Anthropic
  module Models
    # `messages` holds more than one `compaction` block with content. Send only the
    # block the conversation returned last.
    class CompactionBlockAmbiguousError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CompactionBlockAmbiguousErrorDetails) }
      def details
      end
    end
  end
end
