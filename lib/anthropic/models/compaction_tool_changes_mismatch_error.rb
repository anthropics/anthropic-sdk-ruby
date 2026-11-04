# frozen_string_literal: true

module Anthropic
  module Models
    # The `compaction` block's `tool_changes` differs from what was returned with the
    # block.
    class CompactionToolChangesMismatchError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :compaction_tool_changes_mismatch]

      # @return [Anthropic::Models::CompactionToolChangesMismatchErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::CompactionToolChangesMismatchErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
