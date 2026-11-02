# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AnalyticsToolActions < Anthropic::Internal::Type::BaseModel
        # @!attribute edit_tool
        #   Accepted/rejected counts for a single Claude Code tool type.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsToolActionCounts]
        required :edit_tool, -> { Anthropic::Organization::AnalyticsToolActionCounts }

        # @!attribute multi_edit_tool
        #   Accepted/rejected counts for a single Claude Code tool type.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsToolActionCounts]
        required :multi_edit_tool, -> { Anthropic::Organization::AnalyticsToolActionCounts }

        # @!attribute notebook_edit_tool
        #   Accepted/rejected counts for a single Claude Code tool type.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsToolActionCounts]
        required :notebook_edit_tool, -> { Anthropic::Organization::AnalyticsToolActionCounts }

        # @!attribute write_tool
        #   Accepted/rejected counts for a single Claude Code tool type.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsToolActionCounts]
        required :write_tool, -> { Anthropic::Organization::AnalyticsToolActionCounts }

        # @!method initialize(edit_tool:, multi_edit_tool:, notebook_edit_tool:, write_tool:)
        #   Per-tool accepted/rejected counts for Claude Code file modification tools.
        #
        #   @param edit_tool [Anthropic::Models::Organization::AnalyticsToolActionCounts] Accepted/rejected counts for a single Claude Code tool type.
        #
        #   @param multi_edit_tool [Anthropic::Models::Organization::AnalyticsToolActionCounts] Accepted/rejected counts for a single Claude Code tool type.
        #
        #   @param notebook_edit_tool [Anthropic::Models::Organization::AnalyticsToolActionCounts] Accepted/rejected counts for a single Claude Code tool type.
        #
        #   @param write_tool [Anthropic::Models::Organization::AnalyticsToolActionCounts] Accepted/rejected counts for a single Claude Code tool type.
      end
    end
  end
end
