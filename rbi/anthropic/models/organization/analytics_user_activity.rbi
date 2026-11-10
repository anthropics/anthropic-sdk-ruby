# typed: strong

module Anthropic
  module Models
    module Organization
      class AnalyticsUserActivity < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AnalyticsUserActivity,
              Anthropic::Internal::AnyHash
            )
          end

        # Claude.ai activity metrics for a single user on a given day.
        sig { returns(Anthropic::Organization::AnalyticsChatMetrics) }
        attr_reader :chat_metrics

        sig do
          params(
            chat_metrics: Anthropic::Organization::AnalyticsChatMetrics::OrHash
          ).void
        end
        attr_writer :chat_metrics

        # Claude Code activity metrics for a single user on a given day.
        sig { returns(Anthropic::Organization::AnalyticsClaudeCodeMetrics) }
        attr_reader :claude_code_metrics

        sig do
          params(
            claude_code_metrics:
              Anthropic::Organization::AnalyticsClaudeCodeMetrics::OrHash
          ).void
        end
        attr_writer :claude_code_metrics

        # Cowork activity metrics for a single user on a given day.
        sig { returns(Anthropic::Organization::AnalyticsCoworkMetrics) }
        attr_reader :cowork_metrics

        sig do
          params(
            cowork_metrics:
              Anthropic::Organization::AnalyticsCoworkMetrics::OrHash
          ).void
        end
        attr_writer :cowork_metrics

        # Claude Design activity metrics for a single user on a given day.
        sig { returns(Anthropic::Organization::AnalyticsDesignMetrics) }
        attr_reader :design_metrics

        sig do
          params(
            design_metrics:
              Anthropic::Organization::AnalyticsDesignMetrics::OrHash
          ).void
        end
        attr_writer :design_metrics

        # Number of distinct active users represented by this row. Only set for grouped
        # rollups (`group_by[]`); null for per-user rows. In date-range mode, recomputed
        # as an exact distinct count of the group's active members over the requested
        # window, never a sum of per-day values.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :distinct_user_count

        # Office Agent activity metrics for a single user on a given day, broken out by
        # Office product.
        sig { returns(Anthropic::Organization::AnalyticsOfficeMetrics) }
        attr_reader :office_metrics

        sig do
          params(
            office_metrics:
              Anthropic::Organization::AnalyticsOfficeMetrics::OrHash
          ).void
        end
        attr_writer :office_metrics

        # Claude Science activity metrics for a single user on a given day.
        sig { returns(Anthropic::Organization::AnalyticsScienceMetrics) }
        attr_reader :science_metrics

        sig do
          params(
            science_metrics:
              Anthropic::Organization::AnalyticsScienceMetrics::OrHash
          ).void
        end
        attr_writer :science_metrics

        # The user this row describes. Null on rows aggregated across users.
        sig { returns(T.nilable(Anthropic::Organization::AnalyticsUser)) }
        attr_reader :user

        sig do
          params(
            user: T.nilable(Anthropic::Organization::AnalyticsUser::OrHash)
          ).void
        end
        attr_writer :user

        # Number of web searches performed
        sig { returns(Integer) }
        attr_accessor :web_search_count

        # Activity recorded while the member had Chat and Cowork unified (Cowork's
        # features inside claude.ai chat) turned on, split into `chat` (chat activity) and
        # `sessions` (Cowork activity). Omitted from the response where Chat and Cowork
        # unified is not available.
        sig do
          returns(
            T.nilable(
              Anthropic::Organization::AnalyticsChatCoworkUnifiedMetrics
            )
          )
        end
        attr_reader :chat_cowork_unified_metrics

        sig do
          params(
            chat_cowork_unified_metrics:
              T.nilable(
                Anthropic::Organization::AnalyticsChatCoworkUnifiedMetrics::OrHash
              )
          ).void
        end
        attr_writer :chat_cowork_unified_metrics

        # Claude Tag activity in Slack by a user who has linked a Claude account. Activity
        # by Slack users who have not linked an account appears only in the `/summaries`
        # Claude Tag counts, so these rows do not add up to those counts. Omitted from the
        # response on deployments that do not offer Claude Tag reporting.
        sig do
          returns(T.nilable(Anthropic::Organization::AnalyticsClaudeTagMetrics))
        end
        attr_reader :claude_tag_metrics

        sig do
          params(
            claude_tag_metrics:
              T.nilable(
                Anthropic::Organization::AnalyticsClaudeTagMetrics::OrHash
              )
          ).void
        end
        attr_writer :claude_tag_metrics

        # Most recent UTC day (YYYY-MM-DD) on which the user had any counted activity,
        # within the requested window: equal to the requested `date` in single-day mode,
        # and to the latest active day from `starting_date` (inclusive) to `ending_date`
        # (exclusive) in date-range rollup mode — never a day earlier than the window
        # start. On filtered requests (`filter[]`) only days matching the filter count:
        # with `filter[]=rbac_group_id:{id}` it is the last day the user was active while
        # a member of that group, consistent with the row's other metrics. On grouped
        # (`group_by[]`) rows it is the latest day any member of the group was active (the
        # requested `date` in single-day mode). Omitted from the response while
        # last-activity reporting is not enabled for this organization.
        sig { returns(T.nilable(Date)) }
        attr_accessor :last_activity_date

        # Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API
        # spelling. Present only when the request grouped by `rbac_group_id`.
        sig { returns(T.nilable(String)) }
        attr_accessor :rbac_group_id

        # Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
        # is available. Null if the group has been deleted or its name could not be
        # resolved; `rbac_group_id` remains the stable key.
        sig { returns(T.nilable(String)) }
        attr_accessor :rbac_group_name

        # Per-user activity data for a given day.
        sig do
          params(
            chat_metrics: Anthropic::Organization::AnalyticsChatMetrics::OrHash,
            claude_code_metrics:
              Anthropic::Organization::AnalyticsClaudeCodeMetrics::OrHash,
            cowork_metrics:
              Anthropic::Organization::AnalyticsCoworkMetrics::OrHash,
            design_metrics:
              Anthropic::Organization::AnalyticsDesignMetrics::OrHash,
            distinct_user_count: T.nilable(Integer),
            office_metrics:
              Anthropic::Organization::AnalyticsOfficeMetrics::OrHash,
            science_metrics:
              Anthropic::Organization::AnalyticsScienceMetrics::OrHash,
            user: T.nilable(Anthropic::Organization::AnalyticsUser::OrHash),
            web_search_count: Integer,
            chat_cowork_unified_metrics:
              T.nilable(
                Anthropic::Organization::AnalyticsChatCoworkUnifiedMetrics::OrHash
              ),
            claude_tag_metrics:
              T.nilable(
                Anthropic::Organization::AnalyticsClaudeTagMetrics::OrHash
              ),
            last_activity_date: T.nilable(Date),
            rbac_group_id: T.nilable(String),
            rbac_group_name: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Claude.ai activity metrics for a single user on a given day.
          chat_metrics:,
          # Claude Code activity metrics for a single user on a given day.
          claude_code_metrics:,
          # Cowork activity metrics for a single user on a given day.
          cowork_metrics:,
          # Claude Design activity metrics for a single user on a given day.
          design_metrics:,
          # Number of distinct active users represented by this row. Only set for grouped
          # rollups (`group_by[]`); null for per-user rows. In date-range mode, recomputed
          # as an exact distinct count of the group's active members over the requested
          # window, never a sum of per-day values.
          distinct_user_count:,
          # Office Agent activity metrics for a single user on a given day, broken out by
          # Office product.
          office_metrics:,
          # Claude Science activity metrics for a single user on a given day.
          science_metrics:,
          # The user this row describes. Null on rows aggregated across users.
          user:,
          # Number of web searches performed
          web_search_count:,
          # Activity recorded while the member had Chat and Cowork unified (Cowork's
          # features inside claude.ai chat) turned on, split into `chat` (chat activity) and
          # `sessions` (Cowork activity). Omitted from the response where Chat and Cowork
          # unified is not available.
          chat_cowork_unified_metrics: nil,
          # Claude Tag activity in Slack by a user who has linked a Claude account. Activity
          # by Slack users who have not linked an account appears only in the `/summaries`
          # Claude Tag counts, so these rows do not add up to those counts. Omitted from the
          # response on deployments that do not offer Claude Tag reporting.
          claude_tag_metrics: nil,
          # Most recent UTC day (YYYY-MM-DD) on which the user had any counted activity,
          # within the requested window: equal to the requested `date` in single-day mode,
          # and to the latest active day from `starting_date` (inclusive) to `ending_date`
          # (exclusive) in date-range rollup mode — never a day earlier than the window
          # start. On filtered requests (`filter[]`) only days matching the filter count:
          # with `filter[]=rbac_group_id:{id}` it is the last day the user was active while
          # a member of that group, consistent with the row's other metrics. On grouped
          # (`group_by[]`) rows it is the latest day any member of the group was active (the
          # requested `date` in single-day mode). Omitted from the response while
          # last-activity reporting is not enabled for this organization.
          last_activity_date: nil,
          # Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API
          # spelling. Present only when the request grouped by `rbac_group_id`.
          rbac_group_id: nil,
          # Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
          # is available. Null if the group has been deleted or its name could not be
          # resolved; `rbac_group_id` remains the stable key.
          rbac_group_name: nil
        )
        end

        sig do
          override.returns(
            {
              chat_metrics: Anthropic::Organization::AnalyticsChatMetrics,
              claude_code_metrics:
                Anthropic::Organization::AnalyticsClaudeCodeMetrics,
              cowork_metrics: Anthropic::Organization::AnalyticsCoworkMetrics,
              design_metrics: Anthropic::Organization::AnalyticsDesignMetrics,
              distinct_user_count: T.nilable(Integer),
              office_metrics: Anthropic::Organization::AnalyticsOfficeMetrics,
              science_metrics: Anthropic::Organization::AnalyticsScienceMetrics,
              user: T.nilable(Anthropic::Organization::AnalyticsUser),
              web_search_count: Integer,
              chat_cowork_unified_metrics:
                T.nilable(
                  Anthropic::Organization::AnalyticsChatCoworkUnifiedMetrics
                ),
              claude_tag_metrics:
                T.nilable(Anthropic::Organization::AnalyticsClaudeTagMetrics),
              last_activity_date: T.nilable(Date),
              rbac_group_id: T.nilable(String),
              rbac_group_name: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
