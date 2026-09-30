# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsCoreCodeMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute artifacts_created_count
          #   Number of artifacts created in Claude Code sessions: an artifact counts once, on
          #   the day a session first saves it. Counted from 2026-08-17; 0 on earlier days.
          #   Exact in date-range mode: a creation belongs to exactly one day, so the per-day
          #   counts never overlap and their sum over the window is the exact count of
          #   distinct creations in it.
          #
          #   @return [Integer]
          required :artifacts_created_count, Integer

          # @!attribute commit_count
          #   Number of commits made via Claude Code
          #
          #   @return [Integer]
          required :commit_count, Integer

          # @!attribute distinct_session_count
          #   Number of distinct Claude Code sessions. On aggregated rows and in date-range
          #   mode: summed per-day distinct counts. A session essentially never spans a UTC
          #   day, so the sum is in practice the true distinct count.
          #
          #   @return [Integer, nil]
          required :distinct_session_count, Integer, nil?: true

          # @!attribute lines_of_code
          #   Lines of code added and removed via Claude Code.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsLinesOfCode]
          required :lines_of_code, -> { Anthropic::Beta::Organization::BetaAnalyticsLinesOfCode }

          # @!attribute pull_request_count
          #   Number of pull requests created via Claude Code
          #
          #   @return [Integer]
          required :pull_request_count, Integer

          # @!method initialize(artifacts_created_count:, commit_count:, distinct_session_count:, lines_of_code:, pull_request_count:)
          #   Core Claude Code activity metrics for a single user on a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsCoreCodeMetrics} for more
          #   details.
          #
          #   @param artifacts_created_count [Integer] Number of artifacts created in Claude Code sessions: an artifact counts once, on
          #
          #   @param commit_count [Integer] Number of commits made via Claude Code
          #
          #   @param distinct_session_count [Integer, nil] Number of distinct Claude Code sessions. On aggregated rows and in date-range mo
          #
          #   @param lines_of_code [Anthropic::Models::Beta::Organization::BetaAnalyticsLinesOfCode] Lines of code added and removed via Claude Code.
          #
          #   @param pull_request_count [Integer] Number of pull requests created via Claude Code
        end
      end
    end
  end
end
