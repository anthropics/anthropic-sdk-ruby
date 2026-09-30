# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsCoreCodeMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsCoreCodeMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of artifacts created in Claude Code sessions: an artifact counts once, on
          # the day a session first saves it. Counted from 2026-08-17; 0 on earlier days.
          # Exact in date-range mode: a creation belongs to exactly one day, so the per-day
          # counts never overlap and their sum over the window is the exact count of
          # distinct creations in it.
          sig { returns(Integer) }
          attr_accessor :artifacts_created_count

          # Number of commits made via Claude Code
          sig { returns(Integer) }
          attr_accessor :commit_count

          # Number of distinct Claude Code sessions. On aggregated rows and in date-range
          # mode: summed per-day distinct counts. A session essentially never spans a UTC
          # day, so the sum is in practice the true distinct count.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_session_count

          # Lines of code added and removed via Claude Code.
          sig do
            returns(Anthropic::Beta::Organization::BetaAnalyticsLinesOfCode)
          end
          attr_reader :lines_of_code

          sig do
            params(
              lines_of_code:
                Anthropic::Beta::Organization::BetaAnalyticsLinesOfCode::OrHash
            ).void
          end
          attr_writer :lines_of_code

          # Number of pull requests created via Claude Code
          sig { returns(Integer) }
          attr_accessor :pull_request_count

          # Core Claude Code activity metrics for a single user on a given day.
          sig do
            params(
              artifacts_created_count: Integer,
              commit_count: Integer,
              distinct_session_count: T.nilable(Integer),
              lines_of_code:
                Anthropic::Beta::Organization::BetaAnalyticsLinesOfCode::OrHash,
              pull_request_count: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of artifacts created in Claude Code sessions: an artifact counts once, on
            # the day a session first saves it. Counted from 2026-08-17; 0 on earlier days.
            # Exact in date-range mode: a creation belongs to exactly one day, so the per-day
            # counts never overlap and their sum over the window is the exact count of
            # distinct creations in it.
            artifacts_created_count:,
            # Number of commits made via Claude Code
            commit_count:,
            # Number of distinct Claude Code sessions. On aggregated rows and in date-range
            # mode: summed per-day distinct counts. A session essentially never spans a UTC
            # day, so the sum is in practice the true distinct count.
            distinct_session_count:,
            # Lines of code added and removed via Claude Code.
            lines_of_code:,
            # Number of pull requests created via Claude Code
            pull_request_count:
          )
          end

          sig do
            override.returns(
              {
                artifacts_created_count: Integer,
                commit_count: Integer,
                distinct_session_count: T.nilable(Integer),
                lines_of_code:
                  Anthropic::Beta::Organization::BetaAnalyticsLinesOfCode,
                pull_request_count: Integer
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
