# typed: strong

module Anthropic
  module Models
    module Organization
      class AnalyticsPluginActivity < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AnalyticsPluginActivity,
              Anthropic::Internal::AnyHash
            )
          end

        # Claude Code activity metrics for a single plugin on a given day.
        sig do
          returns(Anthropic::Organization::AnalyticsPluginClaudeCodeMetrics)
        end
        attr_reader :claude_code_metrics

        sig do
          params(
            claude_code_metrics:
              Anthropic::Organization::AnalyticsPluginClaudeCodeMetrics::OrHash
          ).void
        end
        attr_writer :claude_code_metrics

        # Cowork activity metrics for a single plugin on a given day.
        sig { returns(Anthropic::Organization::AnalyticsPluginCoworkMetrics) }
        attr_reader :cowork_metrics

        sig do
          params(
            cowork_metrics:
              Anthropic::Organization::AnalyticsPluginCoworkMetrics::OrHash
          ).void
        end
        attr_writer :cowork_metrics

        # Number of distinct users with recorded install or invocation activity for the
        # plugin on the requested day (install-only users count), or, in date-range mode,
        # over the requested window — recomputed as an exact distinct count over the
        # window's per-member daily rows, never a sum of per-day values.
        sig { returns(Integer) }
        attr_accessor :distinct_user_count

        # Number of distinct users who installed the plugin on the requested day, or, in
        # date-range mode, over the requested window — recomputed as an exact distinct
        # count over the window's per-member daily rows, never a sum of per-day values.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :install_count

        # Number of plugin invocations on the requested day
        sig { returns(Integer) }
        attr_accessor :invocation_count

        # Stable plugin identifier when available (e.g. `serena@claude-plugins-official`).
        # Null for third-party Claude Code plugins (redacted at the source) and Cowork
        # slash commands that carry only a hashed id.
        sig { returns(T.nilable(String)) }
        attr_accessor :plugin_id

        # Name of the plugin
        sig { returns(String) }
        attr_accessor :plugin_name

        # Plugin use recorded while members had Chat and Cowork unified (Cowork's features
        # inside claude.ai chat) turned on. A count is null in date-range mode where it
        # cannot be computed. Omitted from the response where Chat and Cowork unified is
        # not available.
        sig do
          returns(
            T.nilable(
              Anthropic::Organization::AnalyticsPluginChatCoworkUnifiedMetrics
            )
          )
        end
        attr_reader :chat_cowork_unified_metrics

        sig do
          params(
            chat_cowork_unified_metrics:
              T.nilable(
                Anthropic::Organization::AnalyticsPluginChatCoworkUnifiedMetrics::OrHash
              )
          ).void
        end
        attr_writer :chat_cowork_unified_metrics

        # Product that produced this row's activity: one of `chat`, `claude_code`,
        # `cowork`, `office_agent`, or `chat_cowork_unified` (Chat and Cowork unified).
        # These are the canonical Cost & Usage product names; an `office_agent` row's
        # per-surface breakdown is in its `office_metrics`. On `/plugins` only `cowork`,
        # `claude_code` and `chat_cowork_unified` occur (the only surfaces with plugin
        # attribution); on `/artifacts` only `chat`, `claude_code`, `cowork` and
        # `chat_cowork_unified` occur (the surfaces that create artifacts);
        # `/apps/chat/projects` does not support the product dimension (a `product` entry
        # in `group_by[]` or `filter[]` there is rejected). Present only when the request
        # grouped by `product`.
        sig { returns(T.nilable(String)) }
        attr_accessor :product

        # Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API
        # spelling. Present only when the request grouped by `rbac_group_id`.
        sig { returns(T.nilable(String)) }
        attr_accessor :rbac_group_id

        # Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
        # is available. Null if the group has been deleted or its name could not be
        # resolved; `rbac_group_id` remains the stable key.
        sig { returns(T.nilable(String)) }
        attr_accessor :rbac_group_name

        # Tagged user identifier (e.g. `user_...`). Present only when the request grouped
        # by `user_id`.
        sig { returns(T.nilable(String)) }
        attr_accessor :user_id

        # Per-plugin install + invocation activity for a given day.
        #
        # With `group_by[]=user_id` / `rbac_group_id` / `product` (`cowork`, `claude_code`
        # and `chat_cowork_unified` only on this endpoint) each row is one (plugin, user),
        # (plugin, group), or (plugin, product) cut: the flat `user_id` / `rbac_group_id`
        # / `product` keys carry the cut and the counts are scoped to it.
        sig do
          params(
            claude_code_metrics:
              Anthropic::Organization::AnalyticsPluginClaudeCodeMetrics::OrHash,
            cowork_metrics:
              Anthropic::Organization::AnalyticsPluginCoworkMetrics::OrHash,
            distinct_user_count: Integer,
            install_count: T.nilable(Integer),
            invocation_count: Integer,
            plugin_id: T.nilable(String),
            plugin_name: String,
            chat_cowork_unified_metrics:
              T.nilable(
                Anthropic::Organization::AnalyticsPluginChatCoworkUnifiedMetrics::OrHash
              ),
            product: T.nilable(String),
            rbac_group_id: T.nilable(String),
            rbac_group_name: T.nilable(String),
            user_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Claude Code activity metrics for a single plugin on a given day.
          claude_code_metrics:,
          # Cowork activity metrics for a single plugin on a given day.
          cowork_metrics:,
          # Number of distinct users with recorded install or invocation activity for the
          # plugin on the requested day (install-only users count), or, in date-range mode,
          # over the requested window — recomputed as an exact distinct count over the
          # window's per-member daily rows, never a sum of per-day values.
          distinct_user_count:,
          # Number of distinct users who installed the plugin on the requested day, or, in
          # date-range mode, over the requested window — recomputed as an exact distinct
          # count over the window's per-member daily rows, never a sum of per-day values.
          install_count:,
          # Number of plugin invocations on the requested day
          invocation_count:,
          # Stable plugin identifier when available (e.g. `serena@claude-plugins-official`).
          # Null for third-party Claude Code plugins (redacted at the source) and Cowork
          # slash commands that carry only a hashed id.
          plugin_id:,
          # Name of the plugin
          plugin_name:,
          # Plugin use recorded while members had Chat and Cowork unified (Cowork's features
          # inside claude.ai chat) turned on. A count is null in date-range mode where it
          # cannot be computed. Omitted from the response where Chat and Cowork unified is
          # not available.
          chat_cowork_unified_metrics: nil,
          # Product that produced this row's activity: one of `chat`, `claude_code`,
          # `cowork`, `office_agent`, or `chat_cowork_unified` (Chat and Cowork unified).
          # These are the canonical Cost & Usage product names; an `office_agent` row's
          # per-surface breakdown is in its `office_metrics`. On `/plugins` only `cowork`,
          # `claude_code` and `chat_cowork_unified` occur (the only surfaces with plugin
          # attribution); on `/artifacts` only `chat`, `claude_code`, `cowork` and
          # `chat_cowork_unified` occur (the surfaces that create artifacts);
          # `/apps/chat/projects` does not support the product dimension (a `product` entry
          # in `group_by[]` or `filter[]` there is rejected). Present only when the request
          # grouped by `product`.
          product: nil,
          # Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API
          # spelling. Present only when the request grouped by `rbac_group_id`.
          rbac_group_id: nil,
          # Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
          # is available. Null if the group has been deleted or its name could not be
          # resolved; `rbac_group_id` remains the stable key.
          rbac_group_name: nil,
          # Tagged user identifier (e.g. `user_...`). Present only when the request grouped
          # by `user_id`.
          user_id: nil
        )
        end

        sig do
          override.returns(
            {
              claude_code_metrics:
                Anthropic::Organization::AnalyticsPluginClaudeCodeMetrics,
              cowork_metrics:
                Anthropic::Organization::AnalyticsPluginCoworkMetrics,
              distinct_user_count: Integer,
              install_count: T.nilable(Integer),
              invocation_count: Integer,
              plugin_id: T.nilable(String),
              plugin_name: String,
              chat_cowork_unified_metrics:
                T.nilable(
                  Anthropic::Organization::AnalyticsPluginChatCoworkUnifiedMetrics
                ),
              product: T.nilable(String),
              rbac_group_id: T.nilable(String),
              rbac_group_name: T.nilable(String),
              user_id: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
