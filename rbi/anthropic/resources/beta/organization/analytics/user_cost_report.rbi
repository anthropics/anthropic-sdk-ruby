# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Analytics
          class UserCostReport
            # Get per-user cost in USD across a date range.
            #
            # Returns one row per user, ranked by spend. Use this to see which users account
            # for the most cost. Only cost attributable to a seat user is included; for
            # organization-wide totals including direct API-key and automation traffic, use
            # the bucketed `/v1/organizations/analytics/cost_report` endpoint. Available to
            # organizations on a Claude Enterprise plan. Requires an API key with the
            # `read:analytics` scope.
            sig do
              params(
                starting_at: Time,
                bucket_width:
                  T.nilable(
                    Anthropic::Beta::Organization::Analytics::UserCostReportListParams::BucketWidth::OrSymbol
                  ),
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
                ending_at: T.nilable(Time),
                exclude_deleted_users: T::Boolean,
                group_by:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::Analytics::UserCostReportListParams::GroupBy::OrSymbol
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
                  Anthropic::Beta::Organization::Analytics::UserCostReportListParams::Order::OrSymbol,
                order_by:
                  Anthropic::Beta::Organization::Analytics::UserCostReportListParams::OrderBy::OrSymbol,
                page: T.nilable(String),
                products:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::BetaAnalyticsProductFilter::OrSymbol
                    ]
                  ),
                rbac_group_ids: T.nilable(T::Array[String]),
                slack_channel_ids: T.nilable(T::Array[String]),
                speeds:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::Analytics::UserCostReportListParams::Speed::OrSymbol
                    ]
                  ),
                user_ids: T.nilable(T::Array[String]),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::BetaAnalyticsCostUsersItem
                ]
              )
            end
            def list(
              # Start of range, inclusive. RFC 3339 tz-aware. Must be within the last 365 days
              # and no earlier than 2026-01-01T00:00:00Z.
              starting_at:,
              # Time-bucket granularity. When set, each row's `starting_at` and `ending_at` are
              # populated and one actor may span several rows (one per time bucket with usage).
              # The time bucket counts toward `limit`, so one page can return multiple rows for
              # the same actor. `ending_at` is required when `bucket_width` is set, and with
              # `bucket_width="1m"` the range may span at most 24 hours. When omitted, each row
              # aggregates the full `[starting_at, ending_at)` range.
              bucket_width: nil,
              # Filter to Claude Tag (Claude in Slack) usage in specific spend categories. Usage
              # with no category never matches. `dm` usage is reported under the user's product
              # rather than `claude-tag`, so combining this filter with `products[]=claude-tag`
              # excludes it. Use `group_by[]=claude_tag_category` to break out per-category
              # values.
              claude_tag_categories: nil,
              # Filter to Claude Tag (Claude in Slack) usage attributed to specific Slack users,
              # by Slack user ID (for example `U0123ABCDEF`), not claude.ai user ID. Usage that
              # is not Claude Tag, and Claude Tag usage not attributed to a single user, never
              # matches. Use `group_by[]=claude_tag_user_id` to break out per-user values.
              claude_tag_user_ids: nil,
              # Filter to specific context-window pricing tiers. Use `group_by[]=context_window`
              # to break out per-tier values.
              context_windows: nil,
              # End of range, exclusive. When omitted, defaults to the earlier of now and
              # `starting_at` + 31 days. The range may span at most 31 days.
              ending_at: nil,
              # If true, omit rows for users who are deleted (`deleted: true`). A page may
              # contain fewer than `limit` rows; use `has_more` and `next_page` to paginate as
              # usual.
              exclude_deleted_users: nil,
              # Break each actor's row out by the given dimensions. Accepts the same values as
              # the bucketed `/cost_report` endpoint. The `product`, `model`, `context_window`,
              # `inference_geo`, and `speed` dimensions — and the time bucket, when
              # `bucket_width` is set — count toward `limit`. `cost_type` and `token_type` do
              # not: `cost_type` returns one row per cost component (tokens, web search, code
              # execution); `token_type` returns one row per token type, each with
              # `cost_type: "tokens"`; combining both returns the per-token-type rows plus the
              # web-search and code-execution rows. A page can therefore contain more rows than
              # `limit` when `cost_type` or `token_type` is requested.
              group_by: nil,
              # Filter to specific inference regions. `not_available` matches rows where the
              # region is unset. Use `group_by[]=inference_geo` to break out per-region values.
              inference_geos: nil,
              # Number of rows per page (1-1000, default 20). One row per actor unless
              # `group_by[]` or `bucket_width` splits an actor across rows;
              # `cost_type`/`token_type` fan-out rows (cost endpoint only) are the exception —
              # they do not count toward this limit, so `data` can exceed it.
              limit: nil,
              # Models to include. Defaults to all models. Use `group_by[]=model` to break out
              # per-model values.
              models: nil,
              # Sort direction. Defaults to `desc`.
              order: nil,
              # Metric to rank actors by. Defaults to `amount`.
              order_by: nil,
              # Opaque cursor from a previous response's `next_page` field.
              page: nil,
              # Product surfaces to include. Defaults to all products.
              products: nil,
              # Filter to usage attributed to specific RBAC groups. Accepts tagged RBAC group
              # IDs (`rbac_group_...`) or bare group UUIDs. A row matches when the user belonged
              # to any of the listed groups on the (UTC) day the usage occurred; usage with no
              # group attribution never matches.
              rbac_group_ids: nil,
              # Filter to usage originating from specific Slack channels. Use
              # `group_by[]=slack_channel_id` to break out per-channel values.
              slack_channel_ids: nil,
              # Filter to fast or standard inference mode. Use `group_by[]=speed` to break out
              # per-mode values.
              speeds: nil,
              # Filter to specific users by tagged user ID.
              user_ids: nil,
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
