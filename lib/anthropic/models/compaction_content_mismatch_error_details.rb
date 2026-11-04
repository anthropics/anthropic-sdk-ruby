# frozen_string_literal: true

module Anthropic
  module Models
    class CompactionContentMismatchErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :compaction_content_mismatch]
      required :error_code, const: :compaction_content_mismatch

      # @!method initialize(error_code: :compaction_content_mismatch)
      #   The `compaction` block's `content` differs from the text its `signature`
      #   recorded.
      #
      #   @param error_code [Symbol, :compaction_content_mismatch]
    end
  end
end
