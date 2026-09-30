# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsClaudeCodeMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute core_metrics
          #   Core Claude Code activity metrics for a single user on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsCoreCodeMetrics]
          required :core_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsCoreCodeMetrics }

          # @!attribute tool_actions
          #   Per-tool accepted/rejected counts for Claude Code file modification tools.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsToolActions]
          required :tool_actions, -> { Anthropic::Beta::Organization::BetaAnalyticsToolActions }

          # @!method initialize(core_metrics:, tool_actions:)
          #   Claude Code activity metrics for a single user on a given day.
          #
          #   @param core_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsCoreCodeMetrics] Core Claude Code activity metrics for a single user on a given day.
          #
          #   @param tool_actions [Anthropic::Models::Beta::Organization::BetaAnalyticsToolActions] Per-tool accepted/rejected counts for Claude Code file modification tools.
        end
      end
    end
  end
end
