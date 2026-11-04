# frozen_string_literal: true

module Anthropic
  module Models
    class CompactionToolChangesMismatchErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :compaction_tool_changes_mismatch]
      required :error_code, const: :compaction_tool_changes_mismatch

      # @!method initialize(error_code: :compaction_tool_changes_mismatch)
      #   The `compaction` block's `tool_changes` differs from what was returned with the
      #   block.
      #
      #   @param error_code [Symbol, :compaction_tool_changes_mismatch]
    end
  end
end
