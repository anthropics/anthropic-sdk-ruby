# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Analytics
          class UsageReport
            # Get token usage over time across a date range.
            #
            # Returns token usage bucketed by minute, hour, or day, optionally broken down by
            # product, model, context window, inference region, or speed. Available to
            # organizations on a Claude Enterprise plan. Requires an API key with the
            # `read:analytics` scope.
            sig do
              params(
                starting_at: Time,
                bucket_width:
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::BucketWidth::OrSymbol,
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
                group_by:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy::OrSymbol
                    ]
                  ),
                inference_geos:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::BetaAnalyticsInferenceGeoFilter::OrSymbol
                    ]
                  ),
                limit: T.nilable(Integer),
                models: T.nilable(T::Array[String]),
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
                      Anthropic::Beta::Organization::Analytics::UsageReportListParams::Speed::OrSymbol
                    ]
                  ),
                user_ids: T.nilable(T::Array[String]),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::BetaAnalyticsUsageReportTimeBucket
                ]
              )
            end
            def list(
              # Start of range, inclusive. RFC 3339 tz-aware. Must be within the last 365 days
              # and no earlier than 2026-01-01T00:00:00Z.
              starting_at:,
              # Time bucket granularity.
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
              # Dimensions to break each time bucket out by. Defaults to no grouping (one total
              # per bucket). Each bucket reports at most its top 100 groups; a group beyond that
              # cap has no row in that bucket (there is no remainder row), so grouped buckets
              # are not exhaustive when a dimension has more than 100 distinct values.
              group_by: nil,
              # Filter to specific inference regions. `not_available` matches rows where the
              # region is unset. Use `group_by[]=inference_geo` to break out per-region values.
              inference_geos: nil,
              # Maximum number of time buckets per page. Defaults and caps vary by
              # `bucket_width` (`1d`: default 7, max 31; `1h`: default 24, max 168; `1m`:
              # default 60, max 256).
              limit: nil,
              # Models to include. Defaults to all models. Use `group_by[]=model` to break out
              # per-model values.
              models: nil,
              # Opaque cursor from a previous response's `next_page` field.
              page: nil,
              # Product surfaces to include. Defaults to all products. Use `group_by[]=product`
              # to break out per-product values.
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
