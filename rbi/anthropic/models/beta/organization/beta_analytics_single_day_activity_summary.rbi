# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsSingleDayActivitySummary < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsSingleDayActivitySummary,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of seats currently assigned to members. Null when the response is scoped
          # to an RBAC group — seat assignment is org-wide and has no per-group analogue.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :assigned_seat_count

          # Number of users with Cowork activity on the requested day
          sig { returns(Integer) }
          attr_accessor :cowork_daily_active_user_count

          # Number of users with Cowork activity in the 30-day rolling window
          sig { returns(Integer) }
          attr_accessor :cowork_monthly_active_user_count

          # Number of users with Cowork activity in the 7-day rolling window
          sig { returns(Integer) }
          attr_accessor :cowork_weekly_active_user_count

          # Number of users with token consumption on the requested day
          sig { returns(Integer) }
          attr_accessor :daily_active_user_count

          # Percentage of assigned seats with activity on the requested day
          # (`DAU / assigned_seat_count * 100`). Null when the response is scoped to an RBAC
          # group.
          sig { returns(T.nilable(Float)) }
          attr_accessor :daily_adoption_rate

          # End of the aggregation period (exclusive), UTC midnight in RFC 3339 format (e.g.
          # `2026-01-16T00:00:00Z`).
          sig { returns(Time) }
          attr_accessor :ending_at

          # Number of users with token consumption in the 30-day rolling window
          sig { returns(Integer) }
          attr_accessor :monthly_active_user_count

          # Percentage of assigned seats with activity in the 30-day rolling window
          # (`MAU / assigned_seat_count * 100`). Null when the response is scoped to an RBAC
          # group.
          sig { returns(T.nilable(Float)) }
          attr_accessor :monthly_adoption_rate

          # Number of pending invitations to join the organization. Null when the response
          # is scoped to an RBAC group.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :pending_invite_count

          # Start of the aggregation period (inclusive), UTC midnight in RFC 3339 format
          # (e.g. `2026-01-15T00:00:00Z`).
          sig { returns(Time) }
          attr_accessor :starting_at

          # Number of users with token consumption in the 7-day rolling window
          sig { returns(Integer) }
          attr_accessor :weekly_active_user_count

          # Percentage of assigned seats with activity in the 7-day rolling window
          # (`WAU / assigned_seat_count * 100`). Null when the response is scoped to an RBAC
          # group.
          sig { returns(T.nilable(Float)) }
          attr_accessor :weekly_adoption_rate

          # Number of users with activity in Chat and Cowork unified on the requested day.
          # Omitted from the response on deployments that do not offer Chat and Cowork
          # unified.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :chat_cowork_unified_daily_active_user_count

          # Number of users with activity in Chat and Cowork unified in the 28-day rolling
          # window (30 days when the request filters by `rbac_group_id`). Omitted from the
          # response on deployments that do not offer Chat and Cowork unified.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :chat_cowork_unified_monthly_active_user_count

          # Number of users with activity in Chat and Cowork unified in the 7-day rolling
          # window. Omitted from the response on deployments that do not offer Chat and
          # Cowork unified.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :chat_cowork_unified_weekly_active_user_count

          # Number of users with claude.ai (chat) activity on the requested day. Omitted
          # from the response while the per-product breakdown is not enabled for this
          # organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :chat_daily_active_user_count

          # Number of users with claude.ai (chat) activity in the 30-day rolling window.
          # Omitted from the response while the per-product breakdown is not enabled for
          # this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :chat_monthly_active_user_count

          # Number of users with claude.ai (chat) activity in the 7-day rolling window.
          # Omitted from the response while the per-product breakdown is not enabled for
          # this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :chat_weekly_active_user_count

          # Number of users with Claude Code activity on the requested day. Omitted from the
          # response while the per-product breakdown is not enabled for this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :claude_code_daily_active_user_count

          # Number of users with Claude Code activity in the 30-day rolling window. Omitted
          # from the response while the per-product breakdown is not enabled for this
          # organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :claude_code_monthly_active_user_count

          # Number of users with Claude Code activity in the 7-day rolling window. Omitted
          # from the response while the per-product breakdown is not enabled for this
          # organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :claude_code_weekly_active_user_count

          # Number of users with Claude Design activity on the requested day. Omitted from
          # the response while the per-product breakdown is not enabled for this
          # organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :claude_design_daily_active_user_count

          # Number of users with Claude Design activity in the 30-day rolling window.
          # Omitted from the response while the per-product breakdown is not enabled for
          # this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :claude_design_monthly_active_user_count

          # Number of users with Claude Design activity in the 7-day rolling window. Omitted
          # from the response while the per-product breakdown is not enabled for this
          # organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :claude_design_weekly_active_user_count

          # Number of users with Claude in Office activity on the requested day. Omitted
          # from the response while the per-product breakdown is not enabled for this
          # organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :office_agent_daily_active_user_count

          # Number of users with Claude in Office activity in the 30-day rolling window.
          # Omitted from the response while the per-product breakdown is not enabled for
          # this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :office_agent_monthly_active_user_count

          # Number of users with Claude in Office activity in the 7-day rolling window.
          # Omitted from the response while the per-product breakdown is not enabled for
          # this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :office_agent_weekly_active_user_count

          # Number of users with Claude Science activity on the requested day. Omitted from
          # the response while the per-product breakdown is not enabled for this
          # organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :science_daily_active_user_count

          # Number of users with a Claude Science seat entitlement (per-seat RBAC) at the
          # time of the daily snapshot. The funnel top; independent of the org-level Claude
          # Science toggle. Null when the response is scoped to an RBAC group — entitlement
          # is org-wide and has no per-group analogue. Omitted from the response while the
          # per-product breakdown is not enabled for this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :science_entitled_user_count

          # Number of users with Claude Science activity in the 30-day rolling window.
          # Omitted from the response while the per-product breakdown is not enabled for
          # this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :science_monthly_active_user_count

          # Number of users with Claude Science activity in the 7-day rolling window.
          # Omitted from the response while the per-product breakdown is not enabled for
          # this organization.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :science_weekly_active_user_count

          # Per-day entry in the /summaries response.
          sig do
            params(
              assigned_seat_count: T.nilable(Integer),
              cowork_daily_active_user_count: Integer,
              cowork_monthly_active_user_count: Integer,
              cowork_weekly_active_user_count: Integer,
              daily_active_user_count: Integer,
              daily_adoption_rate: T.nilable(Float),
              ending_at: Time,
              monthly_active_user_count: Integer,
              monthly_adoption_rate: T.nilable(Float),
              pending_invite_count: T.nilable(Integer),
              starting_at: Time,
              weekly_active_user_count: Integer,
              weekly_adoption_rate: T.nilable(Float),
              chat_cowork_unified_daily_active_user_count: T.nilable(Integer),
              chat_cowork_unified_monthly_active_user_count: T.nilable(Integer),
              chat_cowork_unified_weekly_active_user_count: T.nilable(Integer),
              chat_daily_active_user_count: T.nilable(Integer),
              chat_monthly_active_user_count: T.nilable(Integer),
              chat_weekly_active_user_count: T.nilable(Integer),
              claude_code_daily_active_user_count: T.nilable(Integer),
              claude_code_monthly_active_user_count: T.nilable(Integer),
              claude_code_weekly_active_user_count: T.nilable(Integer),
              claude_design_daily_active_user_count: T.nilable(Integer),
              claude_design_monthly_active_user_count: T.nilable(Integer),
              claude_design_weekly_active_user_count: T.nilable(Integer),
              office_agent_daily_active_user_count: T.nilable(Integer),
              office_agent_monthly_active_user_count: T.nilable(Integer),
              office_agent_weekly_active_user_count: T.nilable(Integer),
              science_daily_active_user_count: T.nilable(Integer),
              science_entitled_user_count: T.nilable(Integer),
              science_monthly_active_user_count: T.nilable(Integer),
              science_weekly_active_user_count: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of seats currently assigned to members. Null when the response is scoped
            # to an RBAC group — seat assignment is org-wide and has no per-group analogue.
            assigned_seat_count:,
            # Number of users with Cowork activity on the requested day
            cowork_daily_active_user_count:,
            # Number of users with Cowork activity in the 30-day rolling window
            cowork_monthly_active_user_count:,
            # Number of users with Cowork activity in the 7-day rolling window
            cowork_weekly_active_user_count:,
            # Number of users with token consumption on the requested day
            daily_active_user_count:,
            # Percentage of assigned seats with activity on the requested day
            # (`DAU / assigned_seat_count * 100`). Null when the response is scoped to an RBAC
            # group.
            daily_adoption_rate:,
            # End of the aggregation period (exclusive), UTC midnight in RFC 3339 format (e.g.
            # `2026-01-16T00:00:00Z`).
            ending_at:,
            # Number of users with token consumption in the 30-day rolling window
            monthly_active_user_count:,
            # Percentage of assigned seats with activity in the 30-day rolling window
            # (`MAU / assigned_seat_count * 100`). Null when the response is scoped to an RBAC
            # group.
            monthly_adoption_rate:,
            # Number of pending invitations to join the organization. Null when the response
            # is scoped to an RBAC group.
            pending_invite_count:,
            # Start of the aggregation period (inclusive), UTC midnight in RFC 3339 format
            # (e.g. `2026-01-15T00:00:00Z`).
            starting_at:,
            # Number of users with token consumption in the 7-day rolling window
            weekly_active_user_count:,
            # Percentage of assigned seats with activity in the 7-day rolling window
            # (`WAU / assigned_seat_count * 100`). Null when the response is scoped to an RBAC
            # group.
            weekly_adoption_rate:,
            # Number of users with activity in Chat and Cowork unified on the requested day.
            # Omitted from the response on deployments that do not offer Chat and Cowork
            # unified.
            chat_cowork_unified_daily_active_user_count: nil,
            # Number of users with activity in Chat and Cowork unified in the 28-day rolling
            # window (30 days when the request filters by `rbac_group_id`). Omitted from the
            # response on deployments that do not offer Chat and Cowork unified.
            chat_cowork_unified_monthly_active_user_count: nil,
            # Number of users with activity in Chat and Cowork unified in the 7-day rolling
            # window. Omitted from the response on deployments that do not offer Chat and
            # Cowork unified.
            chat_cowork_unified_weekly_active_user_count: nil,
            # Number of users with claude.ai (chat) activity on the requested day. Omitted
            # from the response while the per-product breakdown is not enabled for this
            # organization.
            chat_daily_active_user_count: nil,
            # Number of users with claude.ai (chat) activity in the 30-day rolling window.
            # Omitted from the response while the per-product breakdown is not enabled for
            # this organization.
            chat_monthly_active_user_count: nil,
            # Number of users with claude.ai (chat) activity in the 7-day rolling window.
            # Omitted from the response while the per-product breakdown is not enabled for
            # this organization.
            chat_weekly_active_user_count: nil,
            # Number of users with Claude Code activity on the requested day. Omitted from the
            # response while the per-product breakdown is not enabled for this organization.
            claude_code_daily_active_user_count: nil,
            # Number of users with Claude Code activity in the 30-day rolling window. Omitted
            # from the response while the per-product breakdown is not enabled for this
            # organization.
            claude_code_monthly_active_user_count: nil,
            # Number of users with Claude Code activity in the 7-day rolling window. Omitted
            # from the response while the per-product breakdown is not enabled for this
            # organization.
            claude_code_weekly_active_user_count: nil,
            # Number of users with Claude Design activity on the requested day. Omitted from
            # the response while the per-product breakdown is not enabled for this
            # organization.
            claude_design_daily_active_user_count: nil,
            # Number of users with Claude Design activity in the 30-day rolling window.
            # Omitted from the response while the per-product breakdown is not enabled for
            # this organization.
            claude_design_monthly_active_user_count: nil,
            # Number of users with Claude Design activity in the 7-day rolling window. Omitted
            # from the response while the per-product breakdown is not enabled for this
            # organization.
            claude_design_weekly_active_user_count: nil,
            # Number of users with Claude in Office activity on the requested day. Omitted
            # from the response while the per-product breakdown is not enabled for this
            # organization.
            office_agent_daily_active_user_count: nil,
            # Number of users with Claude in Office activity in the 30-day rolling window.
            # Omitted from the response while the per-product breakdown is not enabled for
            # this organization.
            office_agent_monthly_active_user_count: nil,
            # Number of users with Claude in Office activity in the 7-day rolling window.
            # Omitted from the response while the per-product breakdown is not enabled for
            # this organization.
            office_agent_weekly_active_user_count: nil,
            # Number of users with Claude Science activity on the requested day. Omitted from
            # the response while the per-product breakdown is not enabled for this
            # organization.
            science_daily_active_user_count: nil,
            # Number of users with a Claude Science seat entitlement (per-seat RBAC) at the
            # time of the daily snapshot. The funnel top; independent of the org-level Claude
            # Science toggle. Null when the response is scoped to an RBAC group — entitlement
            # is org-wide and has no per-group analogue. Omitted from the response while the
            # per-product breakdown is not enabled for this organization.
            science_entitled_user_count: nil,
            # Number of users with Claude Science activity in the 30-day rolling window.
            # Omitted from the response while the per-product breakdown is not enabled for
            # this organization.
            science_monthly_active_user_count: nil,
            # Number of users with Claude Science activity in the 7-day rolling window.
            # Omitted from the response while the per-product breakdown is not enabled for
            # this organization.
            science_weekly_active_user_count: nil
          )
          end

          sig do
            override.returns(
              {
                assigned_seat_count: T.nilable(Integer),
                cowork_daily_active_user_count: Integer,
                cowork_monthly_active_user_count: Integer,
                cowork_weekly_active_user_count: Integer,
                daily_active_user_count: Integer,
                daily_adoption_rate: T.nilable(Float),
                ending_at: Time,
                monthly_active_user_count: Integer,
                monthly_adoption_rate: T.nilable(Float),
                pending_invite_count: T.nilable(Integer),
                starting_at: Time,
                weekly_active_user_count: Integer,
                weekly_adoption_rate: T.nilable(Float),
                chat_cowork_unified_daily_active_user_count: T.nilable(Integer),
                chat_cowork_unified_monthly_active_user_count:
                  T.nilable(Integer),
                chat_cowork_unified_weekly_active_user_count:
                  T.nilable(Integer),
                chat_daily_active_user_count: T.nilable(Integer),
                chat_monthly_active_user_count: T.nilable(Integer),
                chat_weekly_active_user_count: T.nilable(Integer),
                claude_code_daily_active_user_count: T.nilable(Integer),
                claude_code_monthly_active_user_count: T.nilable(Integer),
                claude_code_weekly_active_user_count: T.nilable(Integer),
                claude_design_daily_active_user_count: T.nilable(Integer),
                claude_design_monthly_active_user_count: T.nilable(Integer),
                claude_design_weekly_active_user_count: T.nilable(Integer),
                office_agent_daily_active_user_count: T.nilable(Integer),
                office_agent_monthly_active_user_count: T.nilable(Integer),
                office_agent_weekly_active_user_count: T.nilable(Integer),
                science_daily_active_user_count: T.nilable(Integer),
                science_entitled_user_count: T.nilable(Integer),
                science_monthly_active_user_count: T.nilable(Integer),
                science_weekly_active_user_count: T.nilable(Integer)
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
