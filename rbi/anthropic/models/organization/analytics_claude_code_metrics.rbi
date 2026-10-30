# typed: strong

module Anthropic
  module Models
    module Organization
      class AnalyticsClaudeCodeMetrics < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AnalyticsClaudeCodeMetrics,
              Anthropic::Internal::AnyHash
            )
          end

        # Core Claude Code activity metrics for a single user on a given day.
        sig { returns(Anthropic::Organization::AnalyticsCoreCodeMetrics) }
        attr_reader :core_metrics

        sig do
          params(
            core_metrics:
              Anthropic::Organization::AnalyticsCoreCodeMetrics::OrHash
          ).void
        end
        attr_writer :core_metrics

        # Per-tool accepted/rejected counts for Claude Code file modification tools.
        sig { returns(Anthropic::Organization::AnalyticsToolActions) }
        attr_reader :tool_actions

        sig do
          params(
            tool_actions: Anthropic::Organization::AnalyticsToolActions::OrHash
          ).void
        end
        attr_writer :tool_actions

        # Claude Code activity metrics for a single user on a given day.
        sig do
          params(
            core_metrics:
              Anthropic::Organization::AnalyticsCoreCodeMetrics::OrHash,
            tool_actions: Anthropic::Organization::AnalyticsToolActions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Core Claude Code activity metrics for a single user on a given day.
          core_metrics:,
          # Per-tool accepted/rejected counts for Claude Code file modification tools.
          tool_actions:
        )
        end

        sig do
          override.returns(
            {
              core_metrics: Anthropic::Organization::AnalyticsCoreCodeMetrics,
              tool_actions: Anthropic::Organization::AnalyticsToolActions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
