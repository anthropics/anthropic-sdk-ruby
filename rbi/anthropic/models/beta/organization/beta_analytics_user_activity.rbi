# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsUserActivity < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsUserActivity,
                Anthropic::Internal::AnyHash
              )
            end

          # Claude.ai activity metrics for a single user on a given day.
          sig do
            returns(Anthropic::Beta::Organization::BetaAnalyticsChatMetrics)
          end
          attr_reader :chat_metrics

          sig do
            params(
              chat_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsChatMetrics::OrHash
            ).void
          end
          attr_writer :chat_metrics

          # Claude Code activity metrics for a single user on a given day.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsClaudeCodeMetrics
            )
          end
          attr_reader :claude_code_metrics

          sig do
            params(
              claude_code_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsClaudeCodeMetrics::OrHash
            ).void
          end
          attr_writer :claude_code_metrics

          # Cowork activity metrics for a single user on a given day.
          sig do
            returns(Anthropic::Beta::Organization::BetaAnalyticsCoworkMetrics)
          end
          attr_reader :cowork_metrics

          sig do
            params(
              cowork_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsCoworkMetrics::OrHash
            ).void
          end
          attr_writer :cowork_metrics

          # Claude Design activity metrics for a single user on a given day.
          sig do
            returns(Anthropic::Beta::Organization::BetaAnalyticsDesignMetrics)
          end
          attr_reader :design_metrics

          sig do
            params(
              design_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsDesignMetrics::OrHash
            ).void
          end
          attr_writer :design_metrics

          # Office Agent activity metrics for a single user on a given day, broken out by
          # Office product.
          sig do
            returns(Anthropic::Beta::Organization::BetaAnalyticsOfficeMetrics)
          end
          attr_reader :office_metrics

          sig do
            params(
              office_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsOfficeMetrics::OrHash
            ).void
          end
          attr_writer :office_metrics

          # Claude Science activity metrics for a single user on a given day.
          sig do
            returns(Anthropic::Beta::Organization::BetaAnalyticsScienceMetrics)
          end
          attr_reader :science_metrics

          sig do
            params(
              science_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsScienceMetrics::OrHash
            ).void
          end
          attr_writer :science_metrics

          # Number of web searches performed
          sig { returns(Integer) }
          attr_accessor :web_search_count

          # Activity recorded while the member had Chat and Cowork unified (Cowork's
          # features inside claude.ai chat) turned on, split into `chat` (chat activity) and
          # `sessions` (Cowork activity). Omitted from the response on deployments that do
          # not offer Chat and Cowork unified.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics
              )
            )
          end
          attr_reader :chat_cowork_unified_metrics

          sig do
            params(
              chat_cowork_unified_metrics:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::OrHash
                )
            ).void
          end
          attr_writer :chat_cowork_unified_metrics

          # Number of distinct active users represented by this row. Only set for grouped
          # rollups (`group_by[]`); null for per-user rows. In date-range mode, recomputed
          # as an exact distinct count of the group's active members over the requested
          # window, never a sum of per-day values.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_user_count

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

          # The user this row describes. Null on rows aggregated across users.
          sig do
            returns(T.nilable(Anthropic::Beta::Organization::BetaAnalyticsUser))
          end
          attr_reader :user

          sig do
            params(
              user:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsUser::OrHash
                )
            ).void
          end
          attr_writer :user

          # Per-user activity data for a given day.
          sig do
            params(
              chat_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsChatMetrics::OrHash,
              claude_code_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsClaudeCodeMetrics::OrHash,
              cowork_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsCoworkMetrics::OrHash,
              design_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsDesignMetrics::OrHash,
              office_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsOfficeMetrics::OrHash,
              science_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsScienceMetrics::OrHash,
              web_search_count: Integer,
              chat_cowork_unified_metrics:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::OrHash
                ),
              distinct_user_count: T.nilable(Integer),
              last_activity_date: T.nilable(Date),
              rbac_group_id: T.nilable(String),
              rbac_group_name: T.nilable(String),
              user:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsUser::OrHash
                )
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
            # Office Agent activity metrics for a single user on a given day, broken out by
            # Office product.
            office_metrics:,
            # Claude Science activity metrics for a single user on a given day.
            science_metrics:,
            # Number of web searches performed
            web_search_count:,
            # Activity recorded while the member had Chat and Cowork unified (Cowork's
            # features inside claude.ai chat) turned on, split into `chat` (chat activity) and
            # `sessions` (Cowork activity). Omitted from the response on deployments that do
            # not offer Chat and Cowork unified.
            chat_cowork_unified_metrics: nil,
            # Number of distinct active users represented by this row. Only set for grouped
            # rollups (`group_by[]`); null for per-user rows. In date-range mode, recomputed
            # as an exact distinct count of the group's active members over the requested
            # window, never a sum of per-day values.
            distinct_user_count: nil,
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
            rbac_group_name: nil,
            # The user this row describes. Null on rows aggregated across users.
            user: nil
          )
          end

          sig do
            override.returns(
              {
                chat_metrics:
                  Anthropic::Beta::Organization::BetaAnalyticsChatMetrics,
                claude_code_metrics:
                  Anthropic::Beta::Organization::BetaAnalyticsClaudeCodeMetrics,
                cowork_metrics:
                  Anthropic::Beta::Organization::BetaAnalyticsCoworkMetrics,
                design_metrics:
                  Anthropic::Beta::Organization::BetaAnalyticsDesignMetrics,
                office_metrics:
                  Anthropic::Beta::Organization::BetaAnalyticsOfficeMetrics,
                science_metrics:
                  Anthropic::Beta::Organization::BetaAnalyticsScienceMetrics,
                web_search_count: Integer,
                chat_cowork_unified_metrics:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics
                  ),
                distinct_user_count: T.nilable(Integer),
                last_activity_date: T.nilable(Date),
                rbac_group_id: T.nilable(String),
                rbac_group_name: T.nilable(String),
                user:
                  T.nilable(Anthropic::Beta::Organization::BetaAnalyticsUser)
              }
            )
          end
          def to_hash
          end

          class ChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics,
                  Anthropic::Internal::AnyHash
                )
              end

            # Chat activity recorded while members had Chat and Cowork unified turned on.
            sig do
              returns(
                Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics
              )
            end
            attr_reader :chat

            sig do
              params(
                chat:
                  Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics::OrHash
              ).void
            end
            attr_writer :chat

            # Cowork session activity recorded while members had Chat and Cowork unified
            # turned on.
            sig do
              returns(
                Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics
              )
            end
            attr_reader :sessions

            sig do
              params(
                sessions:
                  Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics::OrHash
              ).void
            end
            attr_writer :sessions

            # Activity recorded while the member had Chat and Cowork unified (Cowork's
            # features inside claude.ai chat) turned on, split into `chat` (chat activity) and
            # `sessions` (Cowork activity). Omitted from the response on deployments that do
            # not offer Chat and Cowork unified.
            sig do
              params(
                chat:
                  Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics::OrHash,
                sessions:
                  Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Chat activity recorded while members had Chat and Cowork unified turned on.
              chat:,
              # Cowork session activity recorded while members had Chat and Cowork unified
              # turned on.
              sessions:
            )
            end

            sig do
              override.returns(
                {
                  chat:
                    Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics,
                  sessions:
                    Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics
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
end
