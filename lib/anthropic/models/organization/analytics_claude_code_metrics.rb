# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AnalyticsClaudeCodeMetrics < Anthropic::Internal::Type::BaseModel
        # @!attribute core_metrics
        #   Core Claude Code activity metrics for a single user on a given day.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsCoreCodeMetrics]
        required :core_metrics, -> { Anthropic::Organization::AnalyticsCoreCodeMetrics }

        # @!attribute tool_actions
        #   Per-tool accepted/rejected counts for Claude Code file modification tools.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsToolActions]
        required :tool_actions, -> { Anthropic::Organization::AnalyticsToolActions }

        # @!method initialize(core_metrics:, tool_actions:)
        #   Claude Code activity metrics for a single user on a given day.
        #
        #   @param core_metrics [Anthropic::Models::Organization::AnalyticsCoreCodeMetrics] Core Claude Code activity metrics for a single user on a given day.
        #
        #   @param tool_actions [Anthropic::Models::Organization::AnalyticsToolActions] Per-tool accepted/rejected counts for Claude Code file modification tools.
      end
    end
  end
end
