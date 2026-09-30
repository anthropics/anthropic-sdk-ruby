# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsPluginActivity < Anthropic::Internal::Type::BaseModel
          # @!attribute claude_code_metrics
          #   Claude Code activity metrics for a single plugin on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsPluginClaudeCodeMetrics]
          required :claude_code_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsPluginClaudeCodeMetrics }

          # @!attribute cowork_metrics
          #   Cowork activity metrics for a single plugin on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsPluginCoworkMetrics]
          required :cowork_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsPluginCoworkMetrics }

          # @!attribute distinct_user_count
          #   Number of distinct users with recorded install or invocation activity for the
          #   plugin on the requested day (install-only users count), or, in date-range mode,
          #   over the requested window — recomputed as an exact distinct count over the
          #   window's per-member daily rows, never a sum of per-day values.
          #
          #   @return [Integer]
          required :distinct_user_count, Integer

          # @!attribute install_count
          #   Number of distinct users who installed the plugin on the requested day, or, in
          #   date-range mode, over the requested window — recomputed as an exact distinct
          #   count over the window's per-member daily rows, never a sum of per-day values.
          #
          #   @return [Integer, nil]
          required :install_count, Integer, nil?: true

          # @!attribute invocation_count
          #   Number of plugin invocations on the requested day
          #
          #   @return [Integer]
          required :invocation_count, Integer

          # @!attribute plugin_name
          #   Name of the plugin
          #
          #   @return [String]
          required :plugin_name, String

          # @!attribute plugin_id
          #   Stable plugin identifier when available (e.g. `serena@claude-plugins-official`).
          #   Null for third-party Claude Code plugins (redacted at the source) and Cowork
          #   slash commands that carry only a hashed id.
          #
          #   @return [String, nil]
          optional :plugin_id, String, nil?: true

          # @!attribute product
          #   Product that produced this row's activity: one of `chat`, `claude_code`,
          #   `cowork`, or `office_agent` (the canonical Cost & Usage product naming; an
          #   `office_agent` row's per-surface breakdown is in its `office_metrics`). On
          #   `/plugins` only `cowork` and `claude_code` occur (the only surfaces with plugin
          #   attribution); on `/artifacts` only `chat`, `claude_code`, and `cowork` occur
          #   (the surfaces that create artifacts); `/apps/chat/projects` does not support the
          #   product dimension (a `product` entry in `group_by[]` or `filter[]` there is
          #   rejected). Present only when the request grouped by `product`.
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

          # @!attribute user_id
          #   Tagged user identifier (e.g. `user_...`). Present only when the request grouped
          #   by `user_id`.
          #
          #   @return [String, nil]
          optional :user_id, String, nil?: true

          # @!method initialize(claude_code_metrics:, cowork_metrics:, distinct_user_count:, install_count:, invocation_count:, plugin_name:, plugin_id: nil, product: nil, rbac_group_id: nil, rbac_group_name: nil, user_id: nil)
          #   Per-plugin install + invocation activity for a given day.
          #
          #   With `group_by[]=user_id` / `rbac_group_id` / `product` (`cowork` /
          #   `claude_code` only on this endpoint) each row is one (plugin, user), (plugin,
          #   group), or (plugin, product) cut: the flat `user_id` / `rbac_group_id` /
          #   `product` keys carry the cut and the counts are scoped to it.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsPluginActivity} for more
          #   details.
          #
          #   @param claude_code_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsPluginClaudeCodeMetrics] Claude Code activity metrics for a single plugin on a given day.
          #
          #   @param cowork_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsPluginCoworkMetrics] Cowork activity metrics for a single plugin on a given day.
          #
          #   @param distinct_user_count [Integer] Number of distinct users with recorded install or invocation activity for the pl
          #
          #   @param install_count [Integer, nil] Number of distinct users who installed the plugin on the requested day, or, in d
          #
          #   @param invocation_count [Integer] Number of plugin invocations on the requested day
          #
          #   @param plugin_name [String] Name of the plugin
          #
          #   @param plugin_id [String, nil] Stable plugin identifier when available (e.g. `serena@claude-plugins-official`).
          #
          #   @param product [String, nil] Product that produced this row's activity: one of `chat`, `claude_code`, `cowork
          #
          #   @param rbac_group_id [String, nil] Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API s
          #
          #   @param rbac_group_name [String, nil] Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
          #
          #   @param user_id [String, nil] Tagged user identifier (e.g. `user_...`). Present only when the request grouped
        end
      end
    end
  end
end
