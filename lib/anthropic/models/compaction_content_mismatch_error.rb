# frozen_string_literal: true

module Anthropic
  module Models
    # The `compaction` block's `content` differs from the text its `signature`
    # recorded.
    class CompactionContentMismatchError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :compaction_content_mismatch]

      # @return [Anthropic::Models::CompactionContentMismatchErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CompactionContentMismatchErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
