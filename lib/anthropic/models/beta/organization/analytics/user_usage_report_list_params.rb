# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          # @see Anthropic::Resources::Beta::Organization::Analytics::UserUsageReport#list
          class UserUsageReportListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute starting_at
            #   Start of range, inclusive. RFC 3339 tz-aware. Must be within the last 365 days
            #   and no earlier than 2026-01-01T00:00:00Z.
            #
            #   @return [Time]
            required :starting_at, Time

            # @!attribute bucket_width
            #   Time-bucket granularity. When set, each row's `starting_at` and `ending_at` are
            #   populated and one actor may span several rows (one per time bucket with usage).
            #   The time bucket counts toward `limit`, so one page can return multiple rows for
            #   the same actor. `ending_at` is required when `bucket_width` is set, and with
            #   `bucket_width="1m"` the range may span at most 24 hours. When omitted, each row
            #   aggregates the full `[starting_at, ending_at)` range.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::Analytics::UserUsageReportListParams::BucketWidth, nil]
            optional :bucket_width,
                     enum: -> {
                       Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::BucketWidth
                     },
                     nil?: true

            # @!attribute claude_tag_categories
            #   Filter to Claude Tag (Claude in Slack) usage in specific spend categories. Usage
            #   with no category never matches. `dm` usage is reported under the user's product
            #   rather than `claude-tag`, so combining this filter with `products[]=claude-tag`
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

            # @!attribute ending_at
            #   End of range, exclusive. When omitted, defaults to the earlier of now and
            #   `starting_at` + 31 days. The range may span at most 31 days.
            #
            #   @return [Time, nil]
            optional :ending_at, Time, nil?: true

            # @!attribute exclude_deleted_users
            #   If true, omit rows for users who are deleted (`deleted: true`). A page may
            #   contain fewer than `limit` rows; use `has_more` and `next_page` to paginate as
            #   usual.
            #
            #   @return [Boolean, nil]
            optional :exclude_deleted_users, Anthropic::Internal::Type::Boolean

            # @!attribute group_by
            #   Break each actor's row out by the given dimensions. Accepts the same values as
            #   the bucketed `/usage_report` endpoint. `limit` bounds (actor × time bucket ×
            #   dimension) rows — with dimensions or `bucket_width` present, one actor may span
            #   several rows.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy>, nil]
            optional :group_by,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy]
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
            #   Number of rows per page (1-1000, default 20). One row per actor unless
            #   `group_by[]` or `bucket_width` splits an actor across rows;
            #   `cost_type`/`token_type` fan-out rows (cost endpoint only) are the exception —
            #   they do not count toward this limit, so `data` can exceed it.
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
            #   Sort direction. Defaults to `desc`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::Analytics::UserUsageReportListParams::Order, nil]
            optional :order, enum: -> { Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Order }

            # @!attribute order_by
            #   Metric to rank actors by. Defaults to `total_tokens`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy, nil]
            optional :order_by,
                     enum: -> { Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy }

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page` field.
            #
            #   @return [String, nil]
            optional :page, String, nil?: true

            # @!attribute products
            #   Product surfaces to include. Defaults to all products.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsProductFilter>, nil]
            optional :products,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::BetaAnalyticsProductFilter]
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
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::UserUsageReportListParams::Speed>, nil]
            optional :speeds,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Speed]
                     },
                     nil?: true

            # @!attribute user_ids
            #   Filter to specific users by tagged user ID.
            #
            #   @return [Array<String>, nil]
            optional :user_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!method initialize(starting_at:, bucket_width: nil, claude_tag_categories: nil, claude_tag_user_ids: nil, context_windows: nil, ending_at: nil, exclude_deleted_users: nil, group_by: nil, inference_geos: nil, limit: nil, models: nil, order: nil, order_by: nil, page: nil, products: nil, rbac_group_ids: nil, slack_channel_ids: nil, speeds: nil, user_ids: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Analytics::UserUsageReportListParams}
            #   for more details.
            #
            #   @param starting_at [Time] Start of range, inclusive. RFC 3339 tz-aware. Must be within the last 365 days a
            #
            #   @param bucket_width [Symbol, Anthropic::Models::Beta::Organization::Analytics::UserUsageReportListParams::BucketWidth, nil] Time-bucket granularity. When set, each row's `starting_at` and `ending_at` are
            #
            #   @param claude_tag_categories [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeTagCategory>, nil] Filter to Claude Tag (Claude in Slack) usage in specific spend categories. Usage
            #
            #   @param claude_tag_user_ids [Array<String>, nil] Filter to Claude Tag (Claude in Slack) usage attributed to specific Slack users,
            #
            #   @param context_windows [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsContextWindow>, nil] Filter to specific context-window pricing tiers. Use `group_by[]=context_window`
            #
            #   @param ending_at [Time, nil] End of range, exclusive. When omitted, defaults to the earlier of now and `start
            #
            #   @param exclude_deleted_users [Boolean] If true, omit rows for users who are deleted (`deleted: true`). A page may conta
            #
            #   @param group_by [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy>, nil] Break each actor's row out by the given dimensions. Accepts the same values as t
            #
            #   @param inference_geos [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsInferenceGeoFilter>, nil] Filter to specific inference regions. `not_available` matches rows where the reg
            #
            #   @param limit [Integer] Number of rows per page (1-1000, default 20). One row per actor unless `group_by
            #
            #   @param models [Array<String>, nil] Models to include. Defaults to all models. Use `group_by[]=model` to break out p
            #
            #   @param order [Symbol, Anthropic::Models::Beta::Organization::Analytics::UserUsageReportListParams::Order] Sort direction. Defaults to `desc`.
            #
            #   @param order_by [Symbol, Anthropic::Models::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy] Metric to rank actors by. Defaults to `total_tokens`.
            #
            #   @param page [String, nil] Opaque cursor from a previous response's `next_page` field.
            #
            #   @param products [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsProductFilter>, nil] Product surfaces to include. Defaults to all products.
            #
            #   @param rbac_group_ids [Array<String>, nil] Filter to usage attributed to specific RBAC groups. Accepts tagged RBAC group ID
            #
            #   @param slack_channel_ids [Array<String>, nil] Filter to usage originating from specific Slack channels. Use `group*by[]=slack*
            #
            #   @param speeds [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::UserUsageReportListParams::Speed>, nil] Filter to fast or standard inference mode. Use `group_by[]=speed` to break out p
            #
            #   @param user_ids [Array<String>, nil] Filter to specific users by tagged user ID.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

            # Time-bucket granularity. When set, each row's `starting_at` and `ending_at` are
            # populated and one actor may span several rows (one per time bucket with usage).
            # The time bucket counts toward `limit`, so one page can return multiple rows for
            # the same actor. `ending_at` is required when `bucket_width` is set, and with
            # `bucket_width="1m"` the range may span at most 24 hours. When omitted, each row
            # aggregates the full `[starting_at, ending_at)` range.
            module BucketWidth
              extend Anthropic::Internal::Type::Enum

              DAY = :"1d"
              HOUR = :"1h"
              MINUTE = :"1m"

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            module GroupBy
              extend Anthropic::Internal::Type::Enum

              CLAUDE_TAG_CATEGORY = :claude_tag_category
              CLAUDE_TAG_USER_ID = :claude_tag_user_id
              CONTEXT_WINDOW = :context_window
              INFERENCE_GEO = :inference_geo
              MODEL = :model
              PRODUCT = :product
              RBAC_GROUP_ID = :rbac_group_id
              SLACK_CHANNEL_ID = :slack_channel_id
              SPEED = :speed

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Sort direction. Defaults to `desc`.
            module Order
              extend Anthropic::Internal::Type::Enum

              ASC = :asc
              DESC = :desc

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Metric to rank actors by. Defaults to `total_tokens`.
            module OrderBy
              extend Anthropic::Internal::Type::Enum

              OUTPUT_TOKENS = :output_tokens
              REQUESTS = :requests
              TOTAL_TOKENS = :total_tokens
              UNCACHED_INPUT_TOKENS = :uncached_input_tokens

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            module Speed
              extend Anthropic::Internal::Type::Enum

              FAST = :fast
              STANDARD = :standard

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
