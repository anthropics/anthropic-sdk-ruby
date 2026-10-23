# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          # @see Anthropic::Resources::Beta::Organization::Analytics::Cost#list
          class CostListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute starting_at
            #   Start of range, inclusive. RFC 3339 tz-aware. Must be within the last 365 days
            #   and no earlier than 2026-01-01T00:00:00Z.
            #
            #   @return [Time]
            required :starting_at, Time

            # @!attribute actor_ids
            #   Filter to usage attributed to specific identities, by tagged ID: a `user_...`,
            #   `svac_...` (service account), or `apikey_...` ID. An `apikey_` entry matches
            #   only usage attributed to the key itself, not usage on that key attributed to a
            #   user or service account (use `api_key_ids[]` for every request a key
            #   authenticated). Federated identities have no tagged ID; select them with
            #   `actor_types[]`. Use `group_by[]=actor` to break out per-identity values.
            #
            #   @return [Array<String>, nil]
            optional :actor_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute actor_types
            #   Filter to usage attributed to specific kinds of identity. Use
            #   `group_by[]=actor_type` to break out per-kind values.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsActorType>, nil]
            optional :actor_types,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaAnalyticsActorType]
                     },
                     nil?: true

            # @!attribute agent_ids
            #   Filter to usage incurred by sessions of specific Claude Managed Agents agents.
            #   Use `group_by[]=agent_id` to break out per-agent values. Claude Developer
            #   Platform organizations only.
            #
            #   @return [Array<String>, nil]
            optional :agent_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute api_key_ids
            #   Filter to usage authenticated by specific API keys, by tagged API key ID
            #   (`apikey_...`), whichever identity the usage is attributed to. Include an empty
            #   entry (`api_key_ids[]=`) to also match usage that no API key authenticated. Use
            #   `group_by[]=api_key_id` to break out per-key values; usage without a key has a
            #   null `api_key_id`. Claude Developer Platform organizations only.
            #
            #   @return [Array<String>, nil]
            optional :api_key_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute claude_tag_categories
            #   Filter to Claude Tag (Claude in Slack) usage in specific spend categories. Usage
            #   with no category never matches. `dm` usage is reported under the user's product
            #   rather than `claude_tag`, so combining this filter with `products[]=claude_tag`
            #   excludes it. Use `group_by[]=claude_tag_category` to break out per-category
            #   values.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeTagCategory>, nil]
            optional :claude_tag_categories,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory]
                     },
                     nil?: true

            # @!attribute claude_tag_user_ids
            #   Filter to Claude Tag (Claude in Slack) usage attributed to specific Slack users,
            #   by Slack user ID (for example `U0123ABCDEF`), not claude.ai user ID. Usage that
            #   is not Claude Tag, and Claude Tag usage not attributed to a single user, never
            #   matches. Use `group_by[]=claude_tag_user_id` to break out per-user values.
            #
            #   @return [Array<String>, nil]
            optional :claude_tag_user_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute context_windows
            #   Filter to specific context-window pricing tiers. Use `group_by[]=context_window`
            #   to break out per-tier values.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsContextWindow>, nil]
            optional :context_windows,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaAnalyticsContextWindow]
                     },
                     nil?: true

            # @!attribute deployment_ids
            #   Filter to usage incurred by Claude Managed Agents sessions that specific
            #   deployments started. Use `group_by[]=deployment_id` to break out per-deployment
            #   values. Claude Developer Platform organizations only.
            #
            #   @return [Array<String>, nil]
            optional :deployment_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute ending_at
            #   End of range, exclusive. When omitted, defaults to the earlier of now and
            #   `starting_at` + 31 days. The range may span at most 31 days.
            #
            #   @return [Time, nil]
            optional :ending_at, Time, nil?: true

            # @!attribute environment_ids
            #   Filter to usage incurred by Claude Managed Agents sessions that ran in specific
            #   environments. Use `group_by[]=environment_id` to break out per-environment
            #   values. Claude Developer Platform organizations only.
            #
            #   @return [Array<String>, nil]
            optional :environment_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute exclude_deleted_users
            #   If true, omit rows whose `actor` is a `user_actor` with `deleted: true`.
            #   Requires `group_by[]=actor`. Rows for other actor types, and rows whose `actor`
            #   is null, are always kept. A page may contain fewer than `limit` rows; use
            #   `has_more` and `next_page` to paginate as usual.
            #
            #   @return [Boolean, nil]
            optional :exclude_deleted_users, Anthropic::Internal::Type::Boolean

            # @!attribute group_by
            #   Dimensions to break cost out by (at most 5, not counting `cost_type` and
            #   `token_type`): one row per combination of their values with cost in the range
            #   (and per time bucket, when `time_bucket_width` is set), every combination
            #   returned across pages rather than a capped top set. `cost_type` and `token_type`
            #   do not count toward `limit`: `cost_type` returns one row per cost component
            #   (tokens, web search, code execution, and `session_usage`, Claude Managed Agents
            #   session time); `token_type` returns one row per token type, each with
            #   `cost_type: "tokens"`; combining both returns the per-token-type rows plus the
            #   web-search, code-execution and session-usage rows. When omitted, a single row
            #   aggregates the whole range.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy>, nil]
            optional :group_by,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy]
                     },
                     nil?: true

            # @!attribute inference_geos
            #   Filter to specific inference regions. `not_available` matches rows where the
            #   region is unset. Use `group_by[]=inference_geo` to break out per-region values.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsInferenceGeoFilter>, nil]
            optional :inference_geos,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaAnalyticsInferenceGeoFilter]
                     },
                     nil?: true

            # @!attribute limit
            #   Number of rows per page (1-1000, default 20). `cost_type`/`token_type` fan-out
            #   rows (cost endpoint only) do not count toward this limit, so `data` can exceed
            #   it.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute models
            #   Models to include. Defaults to all models. Use `group_by[]=model` to break out
            #   per-model values.
            #
            #   @return [Array<String>, nil]
            optional :models, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute order
            #   Sort direction of the `order_by` metric, or of the time buckets when `order_by`
            #   is `time` and `time_bucket_width` is set. Defaults to `desc`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsUsageCostSortOrder, nil]
            optional :order, enum: -> { Anthropic::Beta::Organization::BetaAnalyticsUsageCostSortOrder }

            # @!attribute order_by
            #   Row order. A metric ranks rows by that metric in the `order` direction. `time`
            #   orders rows by time bucket in the `order` direction (newest first by default)
            #   and, within a bucket, by `amount`, highest first. `time` takes effect only with
            #   `time_bucket_width`; without it, `time` is the same as `amount`. Defaults to
            #   `amount`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostOrderBy, nil]
            optional :order_by, enum: -> { Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostOrderBy }

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page` field.
            #
            #   @return [String, nil]
            optional :page, String, nil?: true

            # @!attribute products
            #   Product surfaces to include. Defaults to all products.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsUsageCostProductFilter>, nil]
            optional :products,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter]
                     },
                     nil?: true

            # @!attribute rbac_group_ids
            #   Filter to usage attributed to specific RBAC groups. Accepts tagged RBAC group
            #   IDs (`rbac_group_...`) or bare group UUIDs. A row matches when the user belonged
            #   to any of the listed groups on the (UTC) day the usage occurred; usage with no
            #   group attribution never matches.
            #
            #   @return [Array<String>, nil]
            optional :rbac_group_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute service_tiers
            #   Filter to specific service tiers. Use `group_by[]=service_tier` to break out
            #   per-tier values. Claude Developer Platform organizations only; matches nothing
            #   for a Claude Enterprise organization.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsServiceTier>, nil]
            optional :service_tiers,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaAnalyticsServiceTier]
                     },
                     nil?: true

            # @!attribute session_ids
            #   Filter to usage incurred by specific Claude Managed Agents sessions, by tagged
            #   session ID (`sesn_...`). Use `group_by[]=session_id` to break out per-session
            #   values. Claude Developer Platform organizations only.
            #
            #   @return [Array<String>, nil]
            optional :session_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute slack_channel_ids
            #   Filter to usage originating from specific Slack channels. Use
            #   `group_by[]=slack_channel_id` to break out per-channel values.
            #
            #   @return [Array<String>, nil]
            optional :slack_channel_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute speeds
            #   Filter to fast or standard inference mode. Use `group_by[]=speed` to break out
            #   per-mode values.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsSpeed>, nil]
            optional :speeds,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaAnalyticsSpeed]
                     },
                     nil?: true

            # @!attribute time_bucket_width
            #   Time-bucket granularity. When set, rows are returned per time bucket (one per
            #   bucket and dimension combination with usage) and each row's `starting_at` and
            #   `ending_at` are that bucket's bounds; the time bucket counts toward `limit`.
            #   `ending_at` is required when `time_bucket_width` is set, and with
            #   `time_bucket_width="1m"` the range may span at most 24 hours. When omitted, each
            #   row aggregates the requested range with `starting_at` and `ending_at` each
            #   rounded down to the hour.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsTimeBucketWidth, nil]
            optional :time_bucket_width,
                     enum: -> { Anthropic::Beta::Organization::BetaAnalyticsTimeBucketWidth },
                     nil?: true

            # @!attribute user_profile_ids
            #   Filter to usage attributed to specific user profiles, by tagged user profile ID
            #   (`uprof_...`). Use `group_by[]=user_profile_id` to break out per-profile values.
            #   Claude Developer Platform organizations only.
            #
            #   @return [Array<String>, nil]
            optional :user_profile_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute workspace_ids
            #   Filter to usage in specific workspaces, by tagged workspace ID (`wrkspc_...`).
            #   Use `group_by[]=workspace_id` to break out per-workspace values. Claude
            #   Developer Platform organizations only; matches nothing for a Claude Enterprise
            #   organization.
            #
            #   @return [Array<String>, nil]
            optional :workspace_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute betas
            #   This endpoint is in beta: requests must send `analytics-usage-cost-2026-08-24`
            #   in this header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(starting_at:, actor_ids: nil, actor_types: nil, agent_ids: nil, api_key_ids: nil, claude_tag_categories: nil, claude_tag_user_ids: nil, context_windows: nil, deployment_ids: nil, ending_at: nil, environment_ids: nil, exclude_deleted_users: nil, group_by: nil, inference_geos: nil, limit: nil, models: nil, order: nil, order_by: nil, page: nil, products: nil, rbac_group_ids: nil, service_tiers: nil, session_ids: nil, slack_channel_ids: nil, speeds: nil, time_bucket_width: nil, user_profile_ids: nil, workspace_ids: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Analytics::CostListParams} for more
            #   details.
            #
            #   @param starting_at [Time] Start of range, inclusive. RFC 3339 tz-aware. Must be within the last 365 days a
            #
            #   @param actor_ids [Array<String>, nil] Filter to usage attributed to specific identities, by tagged ID: a `user_...`, `
            #
            #   @param actor_types [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsActorType>, nil] Filter to usage attributed to specific kinds of identity. Use `group*by[]=actor*
            #
            #   @param agent_ids [Array<String>, nil] Filter to usage incurred by sessions of specific Claude Managed Agents agents. U
            #
            #   @param api_key_ids [Array<String>, nil] Filter to usage authenticated by specific API keys, by tagged API key ID (`apike
            #
            #   @param claude_tag_categories [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeTagCategory>, nil] Filter to Claude Tag (Claude in Slack) usage in specific spend categories. Usage
            #
            #   @param claude_tag_user_ids [Array<String>, nil] Filter to Claude Tag (Claude in Slack) usage attributed to specific Slack users,
            #
            #   @param context_windows [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsContextWindow>, nil] Filter to specific context-window pricing tiers. Use `group_by[]=context_window`
            #
            #   @param deployment_ids [Array<String>, nil] Filter to usage incurred by Claude Managed Agents sessions that specific deploym
            #
            #   @param ending_at [Time, nil] End of range, exclusive. When omitted, defaults to the earlier of now and `start
            #
            #   @param environment_ids [Array<String>, nil] Filter to usage incurred by Claude Managed Agents sessions that ran in specific
            #
            #   @param exclude_deleted_users [Boolean] If true, omit rows whose `actor` is a `user_actor` with `deleted: true`. Require
            #
            #   @param group_by [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy>, nil] Dimensions to break cost out by (at most 5, not counting `cost_type` and
            #   `token\_
            #
            #   @param inference_geos [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsInferenceGeoFilter>, nil] Filter to specific inference regions. `not_available` matches rows where the reg
            #
            #   @param limit [Integer] Number of rows per page (1-1000, default 20). `cost_type`/`token_type` fan-out r
            #
            #   @param models [Array<String>, nil] Models to include. Defaults to all models. Use `group_by[]=model` to break out p
            #
            #   @param order [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsUsageCostSortOrder] Sort direction of the `order_by` metric, or of the time buckets when `order_by`
            #
            #   @param order_by [Symbol, Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostOrderBy] Row order. A metric ranks rows by that metric in the `order` direction. `time` o
            #
            #   @param page [String, nil] Opaque cursor from a previous response's `next_page` field.
            #
            #   @param products [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsUsageCostProductFilter>, nil] Product surfaces to include. Defaults to all products.
            #
            #   @param rbac_group_ids [Array<String>, nil] Filter to usage attributed to specific RBAC groups. Accepts tagged RBAC group ID
            #
            #   @param service_tiers [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsServiceTier>, nil] Filter to specific service tiers. Use `group_by[]=service_tier` to break out per
            #
            #   @param session_ids [Array<String>, nil] Filter to usage incurred by specific Claude Managed Agents sessions, by tagged s
            #
            #   @param slack_channel_ids [Array<String>, nil] Filter to usage originating from specific Slack channels. Use `group*by[]=slack*
            #
            #   @param speeds [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsSpeed>, nil] Filter to fast or standard inference mode. Use `group_by[]=speed` to break out p
            #
            #   @param time_bucket_width [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsTimeBucketWidth, nil] Time-bucket granularity. When set, rows are returned per time bucket (one per bu
            #
            #   @param user_profile_ids [Array<String>, nil] Filter to usage attributed to specific user profiles, by tagged user profile ID
            #
            #   @param workspace_ids [Array<String>, nil] Filter to usage in specific workspaces, by tagged workspace ID (`wrkspc_...`). U
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `analytics-usage-cost-2026-08-24` i
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
