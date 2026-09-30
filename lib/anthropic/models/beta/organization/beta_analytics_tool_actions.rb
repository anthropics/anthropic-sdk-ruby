# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsToolActions < Anthropic::Internal::Type::BaseModel
          # @!attribute edit_tool
          #   Accepted/rejected counts for a single Claude Code tool type.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsToolActionCounts]
          required :edit_tool, -> { Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts }

          # @!attribute multi_edit_tool
          #   Accepted/rejected counts for a single Claude Code tool type.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsToolActionCounts]
          required :multi_edit_tool, -> { Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts }

          # @!attribute notebook_edit_tool
          #   Accepted/rejected counts for a single Claude Code tool type.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsToolActionCounts]
          required :notebook_edit_tool, -> { Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts }

          # @!attribute write_tool
          #   Accepted/rejected counts for a single Claude Code tool type.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsToolActionCounts]
          required :write_tool, -> { Anthropic::Beta::Organization::BetaAnalyticsToolActionCounts }

          # @!method initialize(edit_tool:, multi_edit_tool:, notebook_edit_tool:, write_tool:)
          #   Per-tool accepted/rejected counts for Claude Code file modification tools.
          #
          #   @param edit_tool [Anthropic::Models::Beta::Organization::BetaAnalyticsToolActionCounts] Accepted/rejected counts for a single Claude Code tool type.
          #
          #   @param multi_edit_tool [Anthropic::Models::Beta::Organization::BetaAnalyticsToolActionCounts] Accepted/rejected counts for a single Claude Code tool type.
          #
          #   @param notebook_edit_tool [Anthropic::Models::Beta::Organization::BetaAnalyticsToolActionCounts] Accepted/rejected counts for a single Claude Code tool type.
          #
          #   @param write_tool [Anthropic::Models::Beta::Organization::BetaAnalyticsToolActionCounts] Accepted/rejected counts for a single Claude Code tool type.
        end
      end
    end
  end
end
