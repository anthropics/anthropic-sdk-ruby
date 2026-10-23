# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Analytics
          class Cost
            # Get cost in USD across a date range, broken out by dimension.
            #
            # Returns one row per combination of the requested `group_by[]` dimensions (and
            # time bucket, when `time_bucket_width` is set) that has cost in the range, ranked
            # by spend or ordered by time bucket; every combination is returned across pages.
            # With no `group_by[]` and no `time_bucket_width`, a single row aggregates the
            # whole range. Includes all cost, whether or not it is attributable to a seat
            # user. Requires an API key with the `read:analytics` scope, or an Admin API key.
            sig do
              params(
                starting_at: Time,
                actor_ids: T.nilable(T::Array[String]),
                actor_types:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::BetaAnalyticsActorType::OrSymbol
                    ]
                  ),
                agent_ids: T.nilable(T::Array[String]),
                api_key_ids: T.nilable(T::Array[String]),
                claude_tag_categories:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::OrSymbol
                    ]
                  ),
                claude_tag_user_ids: T.nilable(T::Array[String]),
                context_windows:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::BetaAnalyticsContextWindow::OrSymbol
                    ]
                  ),
                deployment_ids: T.nilable(T::Array[String]),
                ending_at: T.nilable(Time),
                environment_ids: T.nilable(T::Array[String]),
                exclude_deleted_users: T::Boolean,
                group_by:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::OrSymbol
                    ]
                  ),
                inference_geos:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::BetaAnalyticsInferenceGeoFilter::OrSymbol
                    ]
                  ),
                limit: Integer,
                models: T.nilable(T::Array[String]),
                order:
                  Anthropic::Beta::Organization::BetaAnalyticsUsageCostSortOrder::OrSymbol,
                order_by:
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostOrderBy::OrSymbol,
                page: T.nilable(String),
                products:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::BetaAnalyticsUsageCostProductFilter::OrSymbol
                    ]
                  ),
                rbac_group_ids: T.nilable(T::Array[String]),
                service_tiers:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::BetaAnalyticsServiceTier::OrSymbol
                    ]
                  ),
                session_ids: T.nilable(T::Array[String]),
                slack_channel_ids: T.nilable(T::Array[String]),
                speeds:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::BetaAnalyticsSpeed::OrSymbol
                    ]
                  ),
                time_bucket_width:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsTimeBucketWidth::OrSymbol
                  ),
                user_profile_ids: T.nilable(T::Array[String]),
                workspace_ids: T.nilable(T::Array[String]),
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::ReportPageCursor[
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostItem
                ]
              )
            end
            def list(
              # Query param: Start of range, inclusive. RFC 3339 tz-aware. Must be within the
              # last 365 days and no earlier than 2026-01-01T00:00:00Z.
              starting_at:,
              # Query param: Filter to usage attributed to specific identities, by tagged ID: a
              # `user_...`, `svac_...` (service account), or `apikey_...` ID. An `apikey_` entry
              # matches only usage attributed to the key itself, not usage on that key
              # attributed to a user or service account (use `api_key_ids[]` for every request a
              # key authenticated). Federated identities have no tagged ID; select them with
              # `actor_types[]`. Use `group_by[]=actor` to break out per-identity values.
              actor_ids: nil,
              # Query param: Filter to usage attributed to specific kinds of identity. Use
              # `group_by[]=actor_type` to break out per-kind values.
              actor_types: nil,
              # Query param: Filter to usage incurred by sessions of specific Claude Managed
              # Agents agents. Use `group_by[]=agent_id` to break out per-agent values. Claude
              # Developer Platform organizations only.
              agent_ids: nil,
              # Query param: Filter to usage authenticated by specific API keys, by tagged API
              # key ID (`apikey_...`), whichever identity the usage is attributed to. Include an
              # empty entry (`api_key_ids[]=`) to also match usage that no API key
              # authenticated. Use `group_by[]=api_key_id` to break out per-key values; usage
              # without a key has a null `api_key_id`. Claude Developer Platform organizations
              # only.
              api_key_ids: nil,
              # Query param: Filter to Claude Tag (Claude in Slack) usage in specific spend
              # categories. Usage with no category never matches. `dm` usage is reported under
              # the user's product rather than `claude_tag`, so combining this filter with
              # `products[]=claude_tag` excludes it. Use `group_by[]=claude_tag_category` to
              # break out per-category values.
              claude_tag_categories: nil,
              # Query param: Filter to Claude Tag (Claude in Slack) usage attributed to specific
              # Slack users, by Slack user ID (for example `U0123ABCDEF`), not claude.ai user
              # ID. Usage that is not Claude Tag, and Claude Tag usage not attributed to a
              # single user, never matches. Use `group_by[]=claude_tag_user_id` to break out
              # per-user values.
              claude_tag_user_ids: nil,
              # Query param: Filter to specific context-window pricing tiers. Use
              # `group_by[]=context_window` to break out per-tier values.
              context_windows: nil,
              # Query param: Filter to usage incurred by Claude Managed Agents sessions that
              # specific deployments started. Use `group_by[]=deployment_id` to break out
              # per-deployment values. Claude Developer Platform organizations only.
              deployment_ids: nil,
              # Query param: End of range, exclusive. Required when `time_bucket_width` is set.
              # Without `time_bucket_width`, defaults to the earlier of now and `starting_at` +
              # 31 days. The range may span at most 31 days.
              ending_at: nil,
              # Query param: Filter to usage incurred by Claude Managed Agents sessions that ran
              # in specific environments. Use `group_by[]=environment_id` to break out
              # per-environment values. Claude Developer Platform organizations only.
              environment_ids: nil,
              # Query param: If true, omit rows whose `actor` is a `user_actor` with
              # `deleted: true`. Requires `group_by[]=actor`. Rows for other actor types, and
              # rows whose `actor` is null, are always kept. A page may contain fewer than
              # `limit` rows; use `has_more` and `next_page` to paginate as usual.
              exclude_deleted_users: nil,
              # Query param: Dimensions to break cost out by (at most 5, not counting
              # `cost_type` and `token_type`): one row per combination of their values with cost
              # in the range (and per time bucket, when `time_bucket_width` is set), every
              # combination returned across pages rather than a capped top set. `cost_type` and
              # `token_type` do not count toward `limit`: `cost_type` returns one row per cost
              # component (tokens, web search, code execution, and `session_usage`, Claude
              # Managed Agents session time); `token_type` returns one row per token type, each
              # with `cost_type: "tokens"`; combining both returns the per-token-type rows plus
              # the web-search, code-execution and session-usage rows. When omitted, a single
              # row aggregates the whole range.
              group_by: nil,
              # Query param: Filter to specific inference regions. `not_available` matches rows
              # where the region is unset. Use `group_by[]=inference_geo` to break out
              # per-region values.
              inference_geos: nil,
              # Query param: Number of rows per page (1-1000, default 20).
              # `cost_type`/`token_type` fan-out rows (cost endpoint only) do not count toward
              # this limit, so `data` can exceed it.
              limit: nil,
              # Query param: Models to include. Defaults to all models. Use `group_by[]=model`
              # to break out per-model values.
              models: nil,
              # Query param: Sort direction of the `order_by` metric, or of the time buckets
              # when `order_by` is `time` and `time_bucket_width` is set. Defaults to `desc`.
              order: nil,
              # Query param: Row order. A metric ranks rows by that metric in the `order`
              # direction. `time` orders rows by time bucket in the `order` direction (newest
              # first by default) and, within a bucket, by `amount`, highest first. `time` takes
              # effect only with `time_bucket_width`; without it, `time` is the same as
              # `amount`. Defaults to `amount`.
              order_by: nil,
              # Query param: Opaque cursor from a previous response's `next_page` field.
              page: nil,
              # Query param: Product surfaces to include. Defaults to all products.
              products: nil,
              # Query param: Filter to usage attributed to specific RBAC groups. Accepts tagged
              # RBAC group IDs (`rbac_group_...`) or bare group UUIDs. A row matches when the
              # user belonged to any of the listed groups on the (UTC) day the usage occurred;
              # usage with no group attribution never matches.
              rbac_group_ids: nil,
              # Query param: Filter to specific service tiers. Use `group_by[]=service_tier` to
              # break out per-tier values. Claude Developer Platform organizations only; matches
              # nothing for a Claude Enterprise organization.
              service_tiers: nil,
              # Query param: Filter to usage incurred by specific Claude Managed Agents
              # sessions, by tagged session ID (`sesn_...`). Use `group_by[]=session_id` to
              # break out per-session values. Claude Developer Platform organizations only.
              session_ids: nil,
              # Query param: Filter to usage originating from specific Slack channels. Use
              # `group_by[]=slack_channel_id` to break out per-channel values.
              slack_channel_ids: nil,
              # Query param: Filter to fast or standard inference mode. Use `group_by[]=speed`
              # to break out per-mode values.
              speeds: nil,
              # Query param: Time-bucket granularity. When set, rows are returned per time
              # bucket (one per bucket and dimension combination with usage) and each row's
              # `starting_at` and `ending_at` are that bucket's bounds; the time bucket counts
              # toward `limit`. `ending_at` is required when `time_bucket_width` is set, and
              # with `time_bucket_width="1m"` the range may span at most 24 hours. When omitted,
              # each row aggregates the requested range with `starting_at` and `ending_at` each
              # rounded down to the hour.
              time_bucket_width: nil,
              # Query param: Filter to usage attributed to specific user profiles, by tagged
              # user profile ID (`uprof_...`). Use `group_by[]=user_profile_id` to break out
              # per-profile values. Claude Developer Platform organizations only.
              user_profile_ids: nil,
              # Query param: Filter to usage in specific workspaces, by tagged workspace ID
              # (`wrkspc_...`). Use `group_by[]=workspace_id` to break out per-workspace values.
              # Claude Developer Platform organizations only; matches nothing for a Claude
              # Enterprise organization.
              workspace_ids: nil,
              # Header param: This endpoint is in beta: requests must send
              # `analytics-usage-cost-2026-08-24` in this header.
              betas: nil,
              request_options: {}
            )
            end

            # @api private
            sig { params(client: Anthropic::Client).returns(T.attached_class) }
            def self.new(client:)
            end
          end
        end
      end
    end
  end
end
