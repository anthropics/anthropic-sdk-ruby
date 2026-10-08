# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorActivity < Anthropic::Internal::Type::BaseModel
          # @!attribute chat_metrics
          #   Claude.ai activity metrics for a single connector on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorChatMetrics]
          required :chat_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsConnectorChatMetrics }

          # @!attribute claude_code_metrics
          #   Claude Code activity metrics for a single connector on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorClaudeCodeMetrics]
          required :claude_code_metrics,
                   -> { Anthropic::Beta::Organization::BetaAnalyticsConnectorClaudeCodeMetrics }

          # @!attribute connector_name
          #   Name of the connector. Some rows carry an opaque connector id here instead of a
          #   readable name; `connector_display_name` holds the resolved name for those rows.
          #
          #   @return [String]
          required :connector_name, String

          # @!attribute cowork_metrics
          #   Cowork activity metrics for a single connector on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorCoworkMetrics]
          required :cowork_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsConnectorCoworkMetrics }

          # @!attribute distinct_user_count
          #   Number of distinct users who used the connector on the requested day, or, in
          #   date-range mode, over the requested window — recomputed as an exact distinct
          #   count over the window's per-member daily rows, never a sum of per-day values.
          #
          #   @return [Integer]
          required :distinct_user_count, Integer

          # @!attribute office_metrics
          #   Office Agent activity metrics for a single connector on a given day, broken out
          #   by Office product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorOfficeMetrics]
          required :office_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeMetrics }

          # @!attribute chat_cowork_unified_metrics
          #   Connector use recorded while members had Chat and Cowork unified (Cowork's
          #   features inside claude.ai chat) turned on, split into chat conversations and
          #   Cowork sessions. A count is null in date-range mode where it cannot be computed.
          #   Omitted from the response on deployments that do not offer Chat and Cowork
          #   unified.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics, nil]
          optional :chat_cowork_unified_metrics,
                   -> {
                     Anthropic::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics
                   },
                   nil?: true

          # @!attribute connector_display_name
          #   Human-readable display name for rows whose `connector_name` is an opaque
          #   connector id rather than a readable name, resolved at request time from the
          #   organization's connectors (including connectors that have since been removed).
          #   `connector_name` remains the row's stable key for sorting and pagination, and
          #   `filter[]=connector_name:{value}` also matches these rows by display name.
          #   Display names are not unique, and the same connector's claude.ai usage can
          #   appear under a separate row with a readable `connector_name`. Null when
          #   `connector_name` is already a readable name, when the id cannot be resolved to
          #   one of the organization's connectors, or when display-name resolution is not
          #   enabled for this organization.
          #
          #   @return [String, nil]
          optional :connector_display_name, String, nil?: true

          # @!attribute individual_auth_distinct_user_count
          #   Number of distinct users whose use of this connector on the requested day ran on
          #   their own individual credential, connected through their own consent flow.
          #   Companion bucket to `managed_auth_distinct_user_count`, which carries the
          #   measurement, attribution, and null rules. Users whose requests used no stored
          #   credential count in neither bucket.
          #
          #   @return [Integer, nil]
          optional :individual_auth_distinct_user_count, Integer, nil?: true

          # @!attribute managed_auth_distinct_user_count
          #   Number of distinct users whose use of this connector on the requested day ran on
          #   Enterprise Managed Auth (an organization-managed credential provisioned through
          #   the organization's identity provider), read from the token record each request
          #   used. Null, never 0, when managed-auth reporting is not enabled for the
          #   organization, the value cannot be attributed to the row, no credentialed
          #   requests and no managed-token mint events (a managed credential being
          #   provisioned for a user's use of the connector) were observed that day, or the
          #   day predates 2026-07-01, the first day the backing data exists (forward-only
          #   data, no backfill). When credentialed requests or mint events were observed and
          #   attributed, both managed-auth fields populate, reporting 0 for a bucket with no
          #   users; the two counts are independent, not a partition — a user whose requests
          #   that day used both kinds of credential counts in both. Mint events carry user
          #   but not surface attribution, so they count as observed auth activity on
          #   `user_id` and `rbac_group_id` cuts — attributed to the user the credential was
          #   provisioned for — but never on a cut that references `product` (group or
          #   filter). Date-range rollup mode (`starting_date`/`ending_date`) computes both
          #   fields exactly over the window — distinct users with at least one qualifying day
          #   — when the whole window starts on or after 2026-07-01, with the null-versus-0
          #   and mint-event rules applying with the window in place of the day; a range
          #   starting earlier reports every managed-auth field as null, never a
          #   partial-window value.
          #
          #   @return [Integer, nil]
          optional :managed_auth_distinct_user_count, Integer, nil?: true

          # @!attribute product
          #   Product that produced this row's activity: one of `chat`, `claude_code`,
          #   `cowork`, `office_agent`, or `chat_cowork_unified` (Chat and Cowork unified).
          #   These are the canonical Cost & Usage product names; an `office_agent` row's
          #   per-surface breakdown is in its `office_metrics`. On `/plugins` only `cowork`,
          #   `claude_code` and `chat_cowork_unified` occur (the only surfaces with plugin
          #   attribution); on `/artifacts` only `chat`, `claude_code`, `cowork` and
          #   `chat_cowork_unified` occur (the surfaces that create artifacts);
          #   `/apps/chat/projects` does not support the product dimension (a `product` entry
          #   in `group_by[]` or `filter[]` there is rejected). Present only when the request
          #   grouped by `product`.
          #
          #   @return [String, nil]
          optional :product, String, nil?: true

          # @!attribute rbac_group_id
          #   Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API
          #   spelling. Present only when the request grouped by `rbac_group_id`.
          #
          #   @return [String, nil]
          optional :rbac_group_id, String, nil?: true

          # @!attribute rbac_group_name
          #   Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
          #   is available. Null if the group has been deleted or its name could not be
          #   resolved; `rbac_group_id` remains the stable key.
          #
          #   @return [String, nil]
          optional :rbac_group_name, String, nil?: true

          # @!attribute read_call_count
          #   Number of connector tool calls on the requested day whose trusted read-only
          #   annotation marked them read-only. Call count, not distinct users. Every call
          #   recorded on a classified surface lands in exactly one of `read_call_count`,
          #   `write_call_count`, or `unclassified_call_count`, so the three sum to the day's
          #   classified calls. Classification is forward-only per surface: claude.ai from
          #   2026-06-01, Claude Code from 2026-05-30, Claude in Office from 2026-05-29,
          #   Cowork from 2026-06-02 (Cowork clients predating annotation forwarding land in
          #   `unclassified_call_count`). Null, never 0, when the value cannot be stated: the
          #   read/write split is not enabled for this organization, or the day predates
          #   2026-05-29. For a date-range total, sum the per-day values, but treat a window
          #   that extends before 2026-05-29 as null rather than summing only its covered days
          #   — date-range rollup mode (`starting_date`/`ending_date`) applies both rules
          #   server-side.
          #
          #   @return [Integer, nil]
          optional :read_call_count, Integer, nil?: true

          # @!attribute unclassified_call_count
          #   Number of connector tool calls on the requested day with no trusted read-only
          #   annotation — the annotation is optional in the MCP spec and is discarded when
          #   connector access controls are active, so unclassified calls are common. This
          #   field shows how much of the day's classified activity the read/write split
          #   actually covers. Call count, not distinct users. One of the three
          #   call-classification buckets; see `read_call_count` for the per-surface
          #   data-start dates, null conditions, and date-range guidance.
          #
          #   @return [Integer, nil]
          optional :unclassified_call_count, Integer, nil?: true

          # @!attribute user_id
          #   Tagged user identifier (e.g. `user_...`). Present only when the request grouped
          #   by `user_id`.
          #
          #   @return [String, nil]
          optional :user_id, String, nil?: true

          # @!attribute write_call_count
          #   Number of connector tool calls on the requested day whose trusted read-only
          #   annotation marked them not read-only. Call count, not distinct users. One of the
          #   three call-classification buckets; see `read_call_count` for the per-surface
          #   data-start dates, null conditions, and date-range guidance.
          #
          #   @return [Integer, nil]
          optional :write_call_count, Integer, nil?: true

          # @!method initialize(chat_metrics:, claude_code_metrics:, connector_name:, cowork_metrics:, distinct_user_count:, office_metrics:, chat_cowork_unified_metrics: nil, connector_display_name: nil, individual_auth_distinct_user_count: nil, managed_auth_distinct_user_count: nil, product: nil, rbac_group_id: nil, rbac_group_name: nil, read_call_count: nil, unclassified_call_count: nil, user_id: nil, write_call_count: nil)
          #   Per-connector activity data for a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity} for more
          #   details.
          #
          #   @param chat_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorChatMetrics] Claude.ai activity metrics for a single connector on a given day.
          #
          #   @param claude_code_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorClaudeCodeMetrics] Claude Code activity metrics for a single connector on a given day.
          #
          #   @param connector_name [String] Name of the connector. Some rows carry an opaque connector id here instead of a
          #
          #   @param cowork_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorCoworkMetrics] Cowork activity metrics for a single connector on a given day.
          #
          #   @param distinct_user_count [Integer] Number of distinct users who used the connector on the requested day, or, in dat
          #
          #   @param office_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorOfficeMetrics] Office Agent activity metrics for a single connector on a given day, broken out
          #
          #   @param chat_cowork_unified_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics, nil] Connector use recorded while members had Chat and Cowork unified (Cowork's featu
          #
          #   @param connector_display_name [String, nil] Human-readable display name for rows whose `connector_name` is an opaque connect
          #
          #   @param individual_auth_distinct_user_count [Integer, nil] Number of distinct users whose use of this connector on the requested day ran on
          #
          #   @param managed_auth_distinct_user_count [Integer, nil] Number of distinct users whose use of this connector on the requested day ran on
          #
          #   @param product [String, nil] Product that produced this row's activity: one of `chat`, `claude_code`, `cowork
          #
          #   @param rbac_group_id [String, nil] Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API s
          #
          #   @param rbac_group_name [String, nil] Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
          #
          #   @param read_call_count [Integer, nil] Number of connector tool calls on the requested day whose trusted read-only anno
          #
          #   @param unclassified_call_count [Integer, nil] Number of connector tool calls on the requested day with no trusted read-only an
          #
          #   @param user_id [String, nil] Tagged user identifier (e.g. `user_...`). Present only when the request grouped
          #
          #   @param write_call_count [Integer, nil] Number of connector tool calls on the requested day whose trusted read-only anno

          # @see Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity#chat_cowork_unified_metrics
          class ChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
            # @!attribute chat
            #   A connector's use in chat conversations recorded while members had Chat and
            #   Cowork unified turned on.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics::Chat]
            required :chat,
                     -> { Anthropic::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics::Chat }

            # @!attribute sessions
            #   A connector's use in Cowork sessions recorded while members had Chat and Cowork
            #   unified turned on.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics::Sessions]
            required :sessions,
                     -> { Anthropic::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics::Sessions }

            # @!method initialize(chat:, sessions:)
            #   Connector use recorded while members had Chat and Cowork unified (Cowork's
            #   features inside claude.ai chat) turned on, split into chat conversations and
            #   Cowork sessions. A count is null in date-range mode where it cannot be computed.
            #   Omitted from the response on deployments that do not offer Chat and Cowork
            #   unified.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics}
            #   for more details.
            #
            #   @param chat [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics::Chat] A connector's use in chat conversations recorded while members had
            #
            #   @param sessions [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics::Sessions] A connector's use in Cowork sessions recorded while members had

            # @see Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics#chat
            class Chat < Anthropic::Internal::Type::BaseModel
              # @!attribute distinct_conversation_connector_used_count
              #   Same measure as `chat_metrics.distinct_conversation_connector_used_count`, for
              #   activity recorded while members had Chat and Cowork unified turned on.
              #   Approximate (HLL, typical error <2%) in date-range mode. Null on aggregated rows
              #   where a distinct count cannot be computed.
              #
              #   @return [Integer, nil]
              required :distinct_conversation_connector_used_count, Integer, nil?: true

              # @!method initialize(distinct_conversation_connector_used_count:)
              #   A connector's use in chat conversations recorded while members had Chat and
              #   Cowork unified turned on.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics::Chat}
              #   for more details.
              #
              #   @param distinct_conversation_connector_used_count [Integer, nil] Same measure as `chat_metrics.distinct_conversation_connector_used_count`, for a
            end

            # @see Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics#sessions
            class Sessions < Anthropic::Internal::Type::BaseModel
              # @!attribute distinct_session_connector_used_count
              #   Same measure as `cowork_metrics.distinct_session_connector_used_count`, for
              #   activity recorded while members had Chat and Cowork unified turned on.
              #   Approximate (HLL, typical error <2%) in date-range mode. Null on aggregated rows
              #   where a distinct count cannot be computed.
              #
              #   @return [Integer, nil]
              required :distinct_session_connector_used_count, Integer, nil?: true

              # @!method initialize(distinct_session_connector_used_count:)
              #   A connector's use in Cowork sessions recorded while members had Chat and Cowork
              #   unified turned on.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics::Sessions}
              #   for more details.
              #
              #   @param distinct_session_connector_used_count [Integer, nil] Same measure as `cowork_metrics.distinct_session_connector_used_count`, for acti
            end
          end
        end
      end
    end
  end
end
