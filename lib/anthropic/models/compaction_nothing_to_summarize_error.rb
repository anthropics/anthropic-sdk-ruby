# frozen_string_literal: true

module Anthropic
  module Models
    # `messages` holds no `user` or `assistant` content to summarize or adopt.
    class CompactionNothingToSummarizeError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :compaction_nothing_to_summarize]

      # @return [Anthropic::Models::CompactionNothingToSummarizeErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CompactionNothingToSummarizeErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
