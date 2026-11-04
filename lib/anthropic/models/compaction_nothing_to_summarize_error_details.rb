# frozen_string_literal: true

module Anthropic
  module Models
    class CompactionNothingToSummarizeErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :compaction_nothing_to_summarize]
      required :error_code, const: :compaction_nothing_to_summarize

      # @!method initialize(error_code: :compaction_nothing_to_summarize)
      #   `messages` holds no `user` or `assistant` content to summarize or adopt.
      #
      #   @param error_code [Symbol, :compaction_nothing_to_summarize]
    end
  end
end
