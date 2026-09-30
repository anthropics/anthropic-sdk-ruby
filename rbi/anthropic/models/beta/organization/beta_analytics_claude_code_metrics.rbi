# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsClaudeCodeMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsClaudeCodeMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Core Claude Code activity metrics for a single user on a given day.
          sig do
            returns(Anthropic::Beta::Organization::BetaAnalyticsCoreCodeMetrics)
          end
          attr_reader :core_metrics

          sig do
            params(
              core_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsCoreCodeMetrics::OrHash
            ).void
          end
          attr_writer :core_metrics

          # Per-tool accepted/rejected counts for Claude Code file modification tools.
          sig do
            returns(Anthropic::Beta::Organization::BetaAnalyticsToolActions)
          end
          attr_reader :tool_actions

          sig do
            params(
              tool_actions:
                Anthropic::Beta::Organization::BetaAnalyticsToolActions::OrHash
            ).void
          end
          attr_writer :tool_actions

          # Claude Code activity metrics for a single user on a given day.
          sig do
            params(
              core_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsCoreCodeMetrics::OrHash,
              tool_actions:
                Anthropic::Beta::Organization::BetaAnalyticsToolActions::OrHash
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
                core_metrics:
                  Anthropic::Beta::Organization::BetaAnalyticsCoreCodeMetrics,
                tool_actions:
                  Anthropic::Beta::Organization::BetaAnalyticsToolActions
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
