# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsSingleDayActivitySummary < Anthropic::Internal::Type::BaseModel
          # @!attribute assigned_seat_count
          #   Number of seats currently assigned to members. Null when the response is scoped
          #   to an RBAC group — seat assignment is org-wide and has no per-group analogue.
          #
          #   @return [Integer, nil]
          required :assigned_seat_count, Integer, nil?: true

          # @!attribute cowork_daily_active_user_count
          #   Number of users with Cowork activity on the requested day
          #
          #   @return [Integer]
          required :cowork_daily_active_user_count, Integer

          # @!attribute cowork_monthly_active_user_count
          #   Number of users with Cowork activity in the 30-day rolling window
          #
          #   @return [Integer]
          required :cowork_monthly_active_user_count, Integer

          # @!attribute cowork_weekly_active_user_count
          #   Number of users with Cowork activity in the 7-day rolling window
          #
          #   @return [Integer]
          required :cowork_weekly_active_user_count, Integer

          # @!attribute daily_active_user_count
          #   Number of users with token consumption on the requested day
          #
          #   @return [Integer]
          required :daily_active_user_count, Integer

          # @!attribute daily_adoption_rate
          #   Percentage of assigned seats with activity on the requested day
          #   (`DAU / assigned_seat_count * 100`). Null when the response is scoped to an RBAC
          #   group.
          #
          #   @return [Float, nil]
          required :daily_adoption_rate, Float, nil?: true

          # @!attribute ending_at
          #   End of the aggregation period (exclusive), UTC midnight in RFC 3339 format (e.g.
          #   `2026-01-16T00:00:00Z`).
          #
          #   @return [Time]
          required :ending_at, Time

          # @!attribute monthly_active_user_count
          #   Number of users with token consumption in the 30-day rolling window
          #
          #   @return [Integer]
          required :monthly_active_user_count, Integer

          # @!attribute monthly_adoption_rate
          #   Percentage of assigned seats with activity in the 30-day rolling window
          #   (`MAU / assigned_seat_count * 100`). Null when the response is scoped to an RBAC
          #   group.
          #
          #   @return [Float, nil]
          required :monthly_adoption_rate, Float, nil?: true

          # @!attribute pending_invite_count
          #   Number of pending invitations to join the organization. Null when the response
          #   is scoped to an RBAC group.
          #
          #   @return [Integer, nil]
          required :pending_invite_count, Integer, nil?: true

          # @!attribute starting_at
          #   Start of the aggregation period (inclusive), UTC midnight in RFC 3339 format
          #   (e.g. `2026-01-15T00:00:00Z`).
          #
          #   @return [Time]
          required :starting_at, Time

          # @!attribute weekly_active_user_count
          #   Number of users with token consumption in the 7-day rolling window
          #
          #   @return [Integer]
          required :weekly_active_user_count, Integer

          # @!attribute weekly_adoption_rate
          #   Percentage of assigned seats with activity in the 7-day rolling window
          #   (`WAU / assigned_seat_count * 100`). Null when the response is scoped to an RBAC
          #   group.
          #
          #   @return [Float, nil]
          required :weekly_adoption_rate, Float, nil?: true

          # @!attribute chat_cowork_unified_daily_active_user_count
          #   Number of users with activity in Chat and Cowork unified on the requested day.
          #   Omitted from the response on deployments that do not offer Chat and Cowork
          #   unified.
          #
          #   @return [Integer, nil]
          optional :chat_cowork_unified_daily_active_user_count, Integer, nil?: true

          # @!attribute chat_cowork_unified_monthly_active_user_count
          #   Number of users with activity in Chat and Cowork unified in the 30-day rolling
          #   window. Omitted from the response on deployments that do not offer Chat and
          #   Cowork unified.
          #
          #   @return [Integer, nil]
          optional :chat_cowork_unified_monthly_active_user_count, Integer, nil?: true

          # @!attribute chat_cowork_unified_weekly_active_user_count
          #   Number of users with activity in Chat and Cowork unified in the 7-day rolling
          #   window. Omitted from the response on deployments that do not offer Chat and
          #   Cowork unified.
          #
          #   @return [Integer, nil]
          optional :chat_cowork_unified_weekly_active_user_count, Integer, nil?: true

          # @!attribute chat_daily_active_user_count
          #   Number of users with claude.ai (chat) activity on the requested day. Omitted
          #   from the response while the per-product breakdown is not enabled for this
          #   organization.
          #
          #   @return [Integer, nil]
          optional :chat_daily_active_user_count, Integer, nil?: true

          # @!attribute chat_monthly_active_user_count
          #   Number of users with claude.ai (chat) activity in the 30-day rolling window.
          #   Omitted from the response while the per-product breakdown is not enabled for
          #   this organization.
          #
          #   @return [Integer, nil]
          optional :chat_monthly_active_user_count, Integer, nil?: true

          # @!attribute chat_weekly_active_user_count
          #   Number of users with claude.ai (chat) activity in the 7-day rolling window.
          #   Omitted from the response while the per-product breakdown is not enabled for
          #   this organization.
          #
          #   @return [Integer, nil]
          optional :chat_weekly_active_user_count, Integer, nil?: true

          # @!attribute claude_code_daily_active_user_count
          #   Number of users with Claude Code activity on the requested day. Omitted from the
          #   response while the per-product breakdown is not enabled for this organization.
          #
          #   @return [Integer, nil]
          optional :claude_code_daily_active_user_count, Integer, nil?: true

          # @!attribute claude_code_monthly_active_user_count
          #   Number of users with Claude Code activity in the 30-day rolling window. Omitted
          #   from the response while the per-product breakdown is not enabled for this
          #   organization.
          #
          #   @return [Integer, nil]
          optional :claude_code_monthly_active_user_count, Integer, nil?: true

          # @!attribute claude_code_weekly_active_user_count
          #   Number of users with Claude Code activity in the 7-day rolling window. Omitted
          #   from the response while the per-product breakdown is not enabled for this
          #   organization.
          #
          #   @return [Integer, nil]
          optional :claude_code_weekly_active_user_count, Integer, nil?: true

          # @!attribute claude_design_daily_active_user_count
          #   Number of users with Claude Design activity on the requested day. Omitted from
          #   the response while the per-product breakdown is not enabled for this
          #   organization.
          #
          #   @return [Integer, nil]
          optional :claude_design_daily_active_user_count, Integer, nil?: true

          # @!attribute claude_design_monthly_active_user_count
          #   Number of users with Claude Design activity in the 30-day rolling window.
          #   Omitted from the response while the per-product breakdown is not enabled for
          #   this organization.
          #
          #   @return [Integer, nil]
          optional :claude_design_monthly_active_user_count, Integer, nil?: true

          # @!attribute claude_design_weekly_active_user_count
          #   Number of users with Claude Design activity in the 7-day rolling window. Omitted
          #   from the response while the per-product breakdown is not enabled for this
          #   organization.
          #
          #   @return [Integer, nil]
          optional :claude_design_weekly_active_user_count, Integer, nil?: true

          # @!attribute office_agent_daily_active_user_count
          #   Number of users with Claude in Office activity on the requested day. Omitted
          #   from the response while the per-product breakdown is not enabled for this
          #   organization.
          #
          #   @return [Integer, nil]
          optional :office_agent_daily_active_user_count, Integer, nil?: true

          # @!attribute office_agent_monthly_active_user_count
          #   Number of users with Claude in Office activity in the 30-day rolling window.
          #   Omitted from the response while the per-product breakdown is not enabled for
          #   this organization.
          #
          #   @return [Integer, nil]
          optional :office_agent_monthly_active_user_count, Integer, nil?: true

          # @!attribute office_agent_weekly_active_user_count
          #   Number of users with Claude in Office activity in the 7-day rolling window.
          #   Omitted from the response while the per-product breakdown is not enabled for
          #   this organization.
          #
          #   @return [Integer, nil]
          optional :office_agent_weekly_active_user_count, Integer, nil?: true

          # @!attribute science_daily_active_user_count
          #   Number of users with Claude Science activity on the requested day. Omitted from
          #   the response while the per-product breakdown is not enabled for this
          #   organization.
          #
          #   @return [Integer, nil]
          optional :science_daily_active_user_count, Integer, nil?: true

          # @!attribute science_entitled_user_count
          #   Number of users with a Claude Science seat entitlement (per-seat RBAC) at the
          #   time of the daily snapshot. The funnel top; independent of the org-level Claude
          #   Science toggle. Null when the response is scoped to an RBAC group — entitlement
          #   is org-wide and has no per-group analogue. Omitted from the response while the
          #   per-product breakdown is not enabled for this organization.
          #
          #   @return [Integer, nil]
          optional :science_entitled_user_count, Integer, nil?: true

          # @!attribute science_monthly_active_user_count
          #   Number of users with Claude Science activity in the 30-day rolling window.
          #   Omitted from the response while the per-product breakdown is not enabled for
          #   this organization.
          #
          #   @return [Integer, nil]
          optional :science_monthly_active_user_count, Integer, nil?: true

          # @!attribute science_weekly_active_user_count
          #   Number of users with Claude Science activity in the 7-day rolling window.
          #   Omitted from the response while the per-product breakdown is not enabled for
          #   this organization.
          #
          #   @return [Integer, nil]
          optional :science_weekly_active_user_count, Integer, nil?: true

          # @!method initialize(assigned_seat_count:, cowork_daily_active_user_count:, cowork_monthly_active_user_count:, cowork_weekly_active_user_count:, daily_active_user_count:, daily_adoption_rate:, ending_at:, monthly_active_user_count:, monthly_adoption_rate:, pending_invite_count:, starting_at:, weekly_active_user_count:, weekly_adoption_rate:, chat_cowork_unified_daily_active_user_count: nil, chat_cowork_unified_monthly_active_user_count: nil, chat_cowork_unified_weekly_active_user_count: nil, chat_daily_active_user_count: nil, chat_monthly_active_user_count: nil, chat_weekly_active_user_count: nil, claude_code_daily_active_user_count: nil, claude_code_monthly_active_user_count: nil, claude_code_weekly_active_user_count: nil, claude_design_daily_active_user_count: nil, claude_design_monthly_active_user_count: nil, claude_design_weekly_active_user_count: nil, office_agent_daily_active_user_count: nil, office_agent_monthly_active_user_count: nil, office_agent_weekly_active_user_count: nil, science_daily_active_user_count: nil, science_entitled_user_count: nil, science_monthly_active_user_count: nil, science_weekly_active_user_count: nil)
          #   Per-day entry in the /summaries response.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsSingleDayActivitySummary}
          #   for more details.
          #
          #   @param assigned_seat_count [Integer, nil] Number of seats currently assigned to members. Null when the response is scoped
          #
          #   @param cowork_daily_active_user_count [Integer] Number of users with Cowork activity on the requested day
          #
          #   @param cowork_monthly_active_user_count [Integer] Number of users with Cowork activity in the 30-day rolling window
          #
          #   @param cowork_weekly_active_user_count [Integer] Number of users with Cowork activity in the 7-day rolling window
          #
          #   @param daily_active_user_count [Integer] Number of users with token consumption on the requested day
          #
          #   @param daily_adoption_rate [Float, nil] Percentage of assigned seats with activity on the requested day (`DAU / assigned
          #
          #   @param ending_at [Time] End of the aggregation period (exclusive), UTC midnight in RFC 3339 format (e.g.
          #
          #   @param monthly_active_user_count [Integer] Number of users with token consumption in the 30-day rolling window
          #
          #   @param monthly_adoption_rate [Float, nil] Percentage of assigned seats with activity in the 30-day rolling window (`MAU /
          #
          #   @param pending_invite_count [Integer, nil] Number of pending invitations to join the organization. Null when the response i
          #
          #   @param starting_at [Time] Start of the aggregation period (inclusive), UTC midnight in RFC 3339 format (e.
          #
          #   @param weekly_active_user_count [Integer] Number of users with token consumption in the 7-day rolling window
          #
          #   @param weekly_adoption_rate [Float, nil] Percentage of assigned seats with activity in the 7-day rolling window (`WAU / a
          #
          #   @param chat_cowork_unified_daily_active_user_count [Integer, nil] Number of users with activity in Chat and Cowork unified on the requested day. O
          #
          #   @param chat_cowork_unified_monthly_active_user_count [Integer, nil] Number of users with activity in Chat and Cowork unified in the 30-day rolling w
          #
          #   @param chat_cowork_unified_weekly_active_user_count [Integer, nil] Number of users with activity in Chat and Cowork unified in the 7-day rolling wi
          #
          #   @param chat_daily_active_user_count [Integer, nil] Number of users with claude.ai (chat) activity on the requested day. Omitted fro
          #
          #   @param chat_monthly_active_user_count [Integer, nil] Number of users with claude.ai (chat) activity in the 30-day rolling window. Omi
          #
          #   @param chat_weekly_active_user_count [Integer, nil] Number of users with claude.ai (chat) activity in the 7-day rolling window. Omit
          #
          #   @param claude_code_daily_active_user_count [Integer, nil] Number of users with Claude Code activity on the requested day. Omitted from the
          #
          #   @param claude_code_monthly_active_user_count [Integer, nil] Number of users with Claude Code activity in the 30-day rolling window. Omitted
          #
          #   @param claude_code_weekly_active_user_count [Integer, nil] Number of users with Claude Code activity in the 7-day rolling window. Omitted f
          #
          #   @param claude_design_daily_active_user_count [Integer, nil] Number of users with Claude Design activity on the requested day. Omitted from t
          #
          #   @param claude_design_monthly_active_user_count [Integer, nil] Number of users with Claude Design activity in the 30-day rolling window. Omitte
          #
          #   @param claude_design_weekly_active_user_count [Integer, nil] Number of users with Claude Design activity in the 7-day rolling window. Omitted
          #
          #   @param office_agent_daily_active_user_count [Integer, nil] Number of users with Claude in Office activity on the requested day. Omitted fro
          #
          #   @param office_agent_monthly_active_user_count [Integer, nil] Number of users with Claude in Office activity in the 30-day rolling window. Omi
          #
          #   @param office_agent_weekly_active_user_count [Integer, nil] Number of users with Claude in Office activity in the 7-day rolling window. Omit
          #
          #   @param science_daily_active_user_count [Integer, nil] Number of users with Claude Science activity on the requested day. Omitted from
          #
          #   @param science_entitled_user_count [Integer, nil] Number of users with a Claude Science seat entitlement (per-seat RBAC) at the ti
          #
          #   @param science_monthly_active_user_count [Integer, nil] Number of users with Claude Science activity in the 30-day rolling window. Omitt
          #
          #   @param science_weekly_active_user_count [Integer, nil] Number of users with Claude Science activity in the 7-day rolling window. Omitte
        end
      end
    end
  end
end
