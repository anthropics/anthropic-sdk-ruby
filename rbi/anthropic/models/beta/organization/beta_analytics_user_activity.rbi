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
                Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Chat
              )
            end
            attr_reader :chat

            sig do
              params(
                chat:
                  Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Chat::OrHash
              ).void
            end
            attr_writer :chat

            # Cowork session activity recorded while members had Chat and Cowork unified
            # turned on.
            sig do
              returns(
                Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Sessions
              )
            end
            attr_reader :sessions

            sig do
              params(
                sessions:
                  Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Sessions::OrHash
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
                  Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Chat::OrHash,
                sessions:
                  Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Sessions::OrHash
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
                    Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Chat,
                  sessions:
                    Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Sessions
                }
              )
            end
            def to_hash
            end

            class Chat < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Chat,
                    Anthropic::Internal::AnyHash
                  )
                end

              # Same measure as `chat_metrics.connectors_used_count`, for activity recorded
              # while members had Chat and Cowork unified turned on.
              sig { returns(Integer) }
              attr_accessor :connectors_used_count

              # Same measure as `chat_metrics.distinct_artifacts_created_count`, for activity
              # recorded while members had Chat and Cowork unified turned on. Exact in
              # date-range mode: a creation belongs to exactly one day, so the per-day counts
              # never overlap and their sum over the window is the exact count of distinct
              # creations in it.
              sig { returns(Integer) }
              attr_accessor :distinct_artifacts_created_count

              # Same measure as `chat_metrics.distinct_connectors_used_count`, for activity
              # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              # count cannot be computed.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :distinct_connectors_used_count

              # Same measure as `chat_metrics.distinct_conversation_count`, for activity
              # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              # count cannot be computed.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :distinct_conversation_count

              # Same measure as `chat_metrics.distinct_files_uploaded_count`, for activity
              # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              # count cannot be computed.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :distinct_files_uploaded_count

              # Same measure as `chat_metrics.distinct_projects_created_count`, for activity
              # recorded while members had Chat and Cowork unified turned on. Exact in
              # date-range mode: a creation belongs to exactly one day, so the per-day counts
              # never overlap and their sum over the window is the exact count of distinct
              # creations in it.
              sig { returns(Integer) }
              attr_accessor :distinct_projects_created_count

              # Same measure as `chat_metrics.distinct_projects_used_count`, for activity
              # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              # count cannot be computed.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :distinct_projects_used_count

              # Always null: shared-artifact views are not currently measured.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :distinct_shared_artifacts_viewed_count

              # Same measure as `chat_metrics.distinct_skills_used_count`, for activity recorded
              # while members had Chat and Cowork unified turned on. Approximate (HLL, typical
              # error <2%) in date-range mode. Null on aggregated rows where a distinct count
              # cannot be computed.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :distinct_skills_used_count

              # Same measure as `chat_metrics.message_count`, for activity recorded while
              # members had Chat and Cowork unified turned on.
              sig { returns(Integer) }
              attr_accessor :message_count

              # Same measure as `chat_metrics.shared_conversations_viewed_count`, for activity
              # recorded while members had Chat and Cowork unified turned on.
              sig { returns(Integer) }
              attr_accessor :shared_conversations_viewed_count

              # Same measure as `chat_metrics.thinking_message_count`, for activity recorded
              # while members had Chat and Cowork unified turned on.
              sig { returns(Integer) }
              attr_accessor :thinking_message_count

              # Chat activity recorded while members had Chat and Cowork unified turned on.
              sig do
                params(
                  connectors_used_count: Integer,
                  distinct_artifacts_created_count: Integer,
                  distinct_connectors_used_count: T.nilable(Integer),
                  distinct_conversation_count: T.nilable(Integer),
                  distinct_files_uploaded_count: T.nilable(Integer),
                  distinct_projects_created_count: Integer,
                  distinct_projects_used_count: T.nilable(Integer),
                  distinct_shared_artifacts_viewed_count: T.nilable(Integer),
                  distinct_skills_used_count: T.nilable(Integer),
                  message_count: Integer,
                  shared_conversations_viewed_count: Integer,
                  thinking_message_count: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                # Same measure as `chat_metrics.connectors_used_count`, for activity recorded
                # while members had Chat and Cowork unified turned on.
                connectors_used_count:,
                # Same measure as `chat_metrics.distinct_artifacts_created_count`, for activity
                # recorded while members had Chat and Cowork unified turned on. Exact in
                # date-range mode: a creation belongs to exactly one day, so the per-day counts
                # never overlap and their sum over the window is the exact count of distinct
                # creations in it.
                distinct_artifacts_created_count:,
                # Same measure as `chat_metrics.distinct_connectors_used_count`, for activity
                # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
                # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
                # count cannot be computed.
                distinct_connectors_used_count:,
                # Same measure as `chat_metrics.distinct_conversation_count`, for activity
                # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
                # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
                # count cannot be computed.
                distinct_conversation_count:,
                # Same measure as `chat_metrics.distinct_files_uploaded_count`, for activity
                # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
                # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
                # count cannot be computed.
                distinct_files_uploaded_count:,
                # Same measure as `chat_metrics.distinct_projects_created_count`, for activity
                # recorded while members had Chat and Cowork unified turned on. Exact in
                # date-range mode: a creation belongs to exactly one day, so the per-day counts
                # never overlap and their sum over the window is the exact count of distinct
                # creations in it.
                distinct_projects_created_count:,
                # Same measure as `chat_metrics.distinct_projects_used_count`, for activity
                # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
                # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
                # count cannot be computed.
                distinct_projects_used_count:,
                # Always null: shared-artifact views are not currently measured.
                distinct_shared_artifacts_viewed_count:,
                # Same measure as `chat_metrics.distinct_skills_used_count`, for activity recorded
                # while members had Chat and Cowork unified turned on. Approximate (HLL, typical
                # error <2%) in date-range mode. Null on aggregated rows where a distinct count
                # cannot be computed.
                distinct_skills_used_count:,
                # Same measure as `chat_metrics.message_count`, for activity recorded while
                # members had Chat and Cowork unified turned on.
                message_count:,
                # Same measure as `chat_metrics.shared_conversations_viewed_count`, for activity
                # recorded while members had Chat and Cowork unified turned on.
                shared_conversations_viewed_count:,
                # Same measure as `chat_metrics.thinking_message_count`, for activity recorded
                # while members had Chat and Cowork unified turned on.
                thinking_message_count:
              )
              end

              sig do
                override.returns(
                  {
                    connectors_used_count: Integer,
                    distinct_artifacts_created_count: Integer,
                    distinct_connectors_used_count: T.nilable(Integer),
                    distinct_conversation_count: T.nilable(Integer),
                    distinct_files_uploaded_count: T.nilable(Integer),
                    distinct_projects_created_count: Integer,
                    distinct_projects_used_count: T.nilable(Integer),
                    distinct_shared_artifacts_viewed_count: T.nilable(Integer),
                    distinct_skills_used_count: T.nilable(Integer),
                    message_count: Integer,
                    shared_conversations_viewed_count: Integer,
                    thinking_message_count: Integer
                  }
                )
              end
              def to_hash
              end
            end

            class Sessions < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::BetaAnalyticsUserActivity::ChatCoworkUnifiedMetrics::Sessions,
                    Anthropic::Internal::AnyHash
                  )
                end

              # Same measure as `cowork_metrics.action_count`, for activity recorded while
              # members had Chat and Cowork unified turned on.
              sig { returns(Integer) }
              attr_accessor :action_count

              # Same measure as `cowork_metrics.artifacts_created_count`, for activity recorded
              # while members had Chat and Cowork unified turned on. Exact in date-range mode: a
              # creation belongs to exactly one day, so the per-day counts never overlap and
              # their sum over the window is the exact count of distinct creations in it.
              sig { returns(Integer) }
              attr_accessor :artifacts_created_count

              # Same measure as `cowork_metrics.connectors_used_count`, for activity recorded
              # while members had Chat and Cowork unified turned on.
              sig { returns(Integer) }
              attr_accessor :connectors_used_count

              # Same measure as `cowork_metrics.dispatch_turn_count`, for activity recorded
              # while members had Chat and Cowork unified turned on.
              sig { returns(Integer) }
              attr_accessor :dispatch_turn_count

              # Same measure as `cowork_metrics.distinct_connectors_used_count`, for activity
              # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              # count cannot be computed.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :distinct_connectors_used_count

              # Same measure as `cowork_metrics.distinct_session_count`, for activity recorded
              # while members had Chat and Cowork unified turned on. Approximate (HLL, typical
              # error <2%) in date-range mode. Null on aggregated rows where a distinct count
              # cannot be computed.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :distinct_session_count

              # Same measure as `cowork_metrics.distinct_skills_used_count`, for activity
              # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              # count cannot be computed.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :distinct_skills_used_count

              # Same measure as `cowork_metrics.message_count`, for activity recorded while
              # members had Chat and Cowork unified turned on.
              sig { returns(Integer) }
              attr_accessor :message_count

              # Same measure as `cowork_metrics.skills_used_count`, for activity recorded while
              # members had Chat and Cowork unified turned on.
              sig { returns(Integer) }
              attr_accessor :skills_used_count

              # Same measure as `cowork_metrics.distinct_plugins_used_count`, for activity
              # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              # count cannot be computed.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :distinct_plugins_used_count

              # Same measure as `cowork_metrics.edit_tool_count`, for activity recorded while
              # members had Chat and Cowork unified turned on.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :edit_tool_count

              # Same measure as `cowork_metrics.file_edit_count`, for activity recorded while
              # members had Chat and Cowork unified turned on.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :file_edit_count

              # Same measure as `cowork_metrics.multi_edit_tool_count`, for activity recorded
              # while members had Chat and Cowork unified turned on.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :multi_edit_tool_count

              # Same measure as `cowork_metrics.notebook_edit_tool_count`, for activity recorded
              # while members had Chat and Cowork unified turned on.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :notebook_edit_tool_count

              # Same measure as `cowork_metrics.plugins_used_count`, for activity recorded while
              # members had Chat and Cowork unified turned on.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :plugins_used_count

              # Same measure as `cowork_metrics.sessions_with_file_edits_count`, for activity
              # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
              # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
              # count cannot be computed.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :sessions_with_file_edits_count

              # Same measure as `cowork_metrics.write_tool_count`, for activity recorded while
              # members had Chat and Cowork unified turned on.
              sig { returns(T.nilable(Integer)) }
              attr_accessor :write_tool_count

              # Cowork session activity recorded while members had Chat and Cowork unified
              # turned on.
              sig do
                params(
                  action_count: Integer,
                  artifacts_created_count: Integer,
                  connectors_used_count: Integer,
                  dispatch_turn_count: Integer,
                  distinct_connectors_used_count: T.nilable(Integer),
                  distinct_session_count: T.nilable(Integer),
                  distinct_skills_used_count: T.nilable(Integer),
                  message_count: Integer,
                  skills_used_count: Integer,
                  distinct_plugins_used_count: T.nilable(Integer),
                  edit_tool_count: T.nilable(Integer),
                  file_edit_count: T.nilable(Integer),
                  multi_edit_tool_count: T.nilable(Integer),
                  notebook_edit_tool_count: T.nilable(Integer),
                  plugins_used_count: T.nilable(Integer),
                  sessions_with_file_edits_count: T.nilable(Integer),
                  write_tool_count: T.nilable(Integer)
                ).returns(T.attached_class)
              end
              def self.new(
                # Same measure as `cowork_metrics.action_count`, for activity recorded while
                # members had Chat and Cowork unified turned on.
                action_count:,
                # Same measure as `cowork_metrics.artifacts_created_count`, for activity recorded
                # while members had Chat and Cowork unified turned on. Exact in date-range mode: a
                # creation belongs to exactly one day, so the per-day counts never overlap and
                # their sum over the window is the exact count of distinct creations in it.
                artifacts_created_count:,
                # Same measure as `cowork_metrics.connectors_used_count`, for activity recorded
                # while members had Chat and Cowork unified turned on.
                connectors_used_count:,
                # Same measure as `cowork_metrics.dispatch_turn_count`, for activity recorded
                # while members had Chat and Cowork unified turned on.
                dispatch_turn_count:,
                # Same measure as `cowork_metrics.distinct_connectors_used_count`, for activity
                # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
                # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
                # count cannot be computed.
                distinct_connectors_used_count:,
                # Same measure as `cowork_metrics.distinct_session_count`, for activity recorded
                # while members had Chat and Cowork unified turned on. Approximate (HLL, typical
                # error <2%) in date-range mode. Null on aggregated rows where a distinct count
                # cannot be computed.
                distinct_session_count:,
                # Same measure as `cowork_metrics.distinct_skills_used_count`, for activity
                # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
                # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
                # count cannot be computed.
                distinct_skills_used_count:,
                # Same measure as `cowork_metrics.message_count`, for activity recorded while
                # members had Chat and Cowork unified turned on.
                message_count:,
                # Same measure as `cowork_metrics.skills_used_count`, for activity recorded while
                # members had Chat and Cowork unified turned on.
                skills_used_count:,
                # Same measure as `cowork_metrics.distinct_plugins_used_count`, for activity
                # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
                # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
                # count cannot be computed.
                distinct_plugins_used_count: nil,
                # Same measure as `cowork_metrics.edit_tool_count`, for activity recorded while
                # members had Chat and Cowork unified turned on.
                edit_tool_count: nil,
                # Same measure as `cowork_metrics.file_edit_count`, for activity recorded while
                # members had Chat and Cowork unified turned on.
                file_edit_count: nil,
                # Same measure as `cowork_metrics.multi_edit_tool_count`, for activity recorded
                # while members had Chat and Cowork unified turned on.
                multi_edit_tool_count: nil,
                # Same measure as `cowork_metrics.notebook_edit_tool_count`, for activity recorded
                # while members had Chat and Cowork unified turned on.
                notebook_edit_tool_count: nil,
                # Same measure as `cowork_metrics.plugins_used_count`, for activity recorded while
                # members had Chat and Cowork unified turned on.
                plugins_used_count: nil,
                # Same measure as `cowork_metrics.sessions_with_file_edits_count`, for activity
                # recorded while members had Chat and Cowork unified turned on. Approximate (HLL,
                # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
                # count cannot be computed.
                sessions_with_file_edits_count: nil,
                # Same measure as `cowork_metrics.write_tool_count`, for activity recorded while
                # members had Chat and Cowork unified turned on.
                write_tool_count: nil
              )
              end

              sig do
                override.returns(
                  {
                    action_count: Integer,
                    artifacts_created_count: Integer,
                    connectors_used_count: Integer,
                    dispatch_turn_count: Integer,
                    distinct_connectors_used_count: T.nilable(Integer),
                    distinct_session_count: T.nilable(Integer),
                    distinct_skills_used_count: T.nilable(Integer),
                    message_count: Integer,
                    skills_used_count: Integer,
                    distinct_plugins_used_count: T.nilable(Integer),
                    edit_tool_count: T.nilable(Integer),
                    file_edit_count: T.nilable(Integer),
                    multi_edit_tool_count: T.nilable(Integer),
                    notebook_edit_tool_count: T.nilable(Integer),
                    plugins_used_count: T.nilable(Integer),
                    sessions_with_file_edits_count: T.nilable(Integer),
                    write_tool_count: T.nilable(Integer)
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
end
