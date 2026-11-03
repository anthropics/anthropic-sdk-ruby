# frozen_string_literal: true

module Anthropic
  module Models
    class CompactionTooManyToolReferencesErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :compaction_too_many_tool_references]
      required :error_code, const: :compaction_too_many_tool_references

      # @!method initialize(error_code: :compaction_too_many_tool_references)
      #   The conversation references more distinct tools than a `compaction` block can
      #   record.
      #
      #   @param error_code [Symbol, :compaction_too_many_tool_references]
    end
  end
end
