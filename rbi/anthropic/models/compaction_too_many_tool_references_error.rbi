# typed: strong

module Anthropic
  module Models
    # The conversation references more distinct tools than a `compaction` block can
    # record.
    class CompactionTooManyToolReferencesError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CompactionTooManyToolReferencesErrorDetails) }
      def details
      end
    end
  end
end
