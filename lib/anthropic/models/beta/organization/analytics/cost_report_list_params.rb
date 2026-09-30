# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          # @see Anthropic::Resources::Beta::Organization::Analytics::CostReport#list
          class CostReportListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute starting_at
            #   Start of range, inclusive. RFC 3339 tz-aware. Must be within the last 365 days
            #   and no earlier than 2026-01-01T00:00:00Z.
            #
            #   @return [Time]
            required :starting_at, Time

            # @!attribute bucket_width
            #   Time bucket granularity.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::Analytics::CostReportListParams::BucketWidth, nil]
            optional :bucket_width,
                     enum: -> { Anthropic::Beta::Organization::Analytics::CostReportListParams::BucketWidth }

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

            # @!attribute group_by
            #   Dimensions to break each time bucket out by. Defaults to no grouping (one total
            #   per bucket). Each bucket reports at most its top 100 groups; a group beyond that
            #   cap has no row in that bucket (there is no remainder row), so grouped buckets
            #   are not exhaustive when a dimension has more than 100 distinct values.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::CostReportListParams::GroupBy>, nil]
            optional :group_by,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::Analytics::CostReportListParams::GroupBy]
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
            #   Maximum number of time buckets per page. Defaults and caps vary by
            #   `bucket_width` (`1d`: default 7, max 31; `1h`: default 24, max 168; `1m`:
            #   default 60, max 256).
            #
            #   @return [Integer, nil]
            optional :limit, Integer, nil?: true

            # @!attribute models
            #   Models to include. Defaults to all models. Use `group_by[]=model` to break out
            #   per-model values.
            #
            #   @return [Array<String>, nil]
            optional :models, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page` field.
            #
            #   @return [String, nil]
            optional :page, String, nil?: true

            # @!attribute products
            #   Product surfaces to include. Defaults to all products. Use `group_by[]=product`
            #   to break out per-product values.
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
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::CostReportListParams::Speed>, nil]
            optional :speeds,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::Analytics::CostReportListParams::Speed]
                     },
                     nil?: true

            # @!attribute user_ids
            #   Filter to specific users by tagged user ID.
            #
            #   @return [Array<String>, nil]
            optional :user_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!method initialize(starting_at:, bucket_width: nil, claude_tag_categories: nil, claude_tag_user_ids: nil, context_windows: nil, ending_at: nil, group_by: nil, inference_geos: nil, limit: nil, models: nil, page: nil, products: nil, rbac_group_ids: nil, slack_channel_ids: nil, speeds: nil, user_ids: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Analytics::CostReportListParams} for
            #   more details.
            #
            #   @param starting_at [Time] Start of range, inclusive. RFC 3339 tz-aware. Must be within the last 365 days a
            #
            #   @param bucket_width [Symbol, Anthropic::Models::Beta::Organization::Analytics::CostReportListParams::BucketWidth] Time bucket granularity.
            #
            #   @param claude_tag_categories [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeTagCategory>, nil] Filter to Claude Tag (Claude in Slack) usage in specific spend categories. Usage
            #
            #   @param claude_tag_user_ids [Array<String>, nil] Filter to Claude Tag (Claude in Slack) usage attributed to specific Slack users,
            #
            #   @param context_windows [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsContextWindow>, nil] Filter to specific context-window pricing tiers. Use `group_by[]=context_window`
            #
            #   @param ending_at [Time, nil] End of range, exclusive. When omitted, defaults to the earlier of now and `start
            #
            #   @param group_by [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::CostReportListParams::GroupBy>, nil] Dimensions to break each time bucket out by. Defaults to no grouping (one total
            #
            #   @param inference_geos [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsInferenceGeoFilter>, nil] Filter to specific inference regions. `not_available` matches rows where the reg
            #
            #   @param limit [Integer, nil] Maximum number of time buckets per page. Defaults and caps vary by `bucket_width
            #
            #   @param models [Array<String>, nil] Models to include. Defaults to all models. Use `group_by[]=model` to break out p
            #
            #   @param page [String, nil] Opaque cursor from a previous response's `next_page` field.
            #
            #   @param products [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsProductFilter>, nil] Product surfaces to include. Defaults to all products. Use `group_by[]=product`
            #
            #   @param rbac_group_ids [Array<String>, nil] Filter to usage attributed to specific RBAC groups. Accepts tagged RBAC group ID
            #
            #   @param slack_channel_ids [Array<String>, nil] Filter to usage originating from specific Slack channels. Use `group*by[]=slack*
            #
            #   @param speeds [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::CostReportListParams::Speed>, nil] Filter to fast or standard inference mode. Use `group_by[]=speed` to break out p
            #
            #   @param user_ids [Array<String>, nil] Filter to specific users by tagged user ID.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

            # Time bucket granularity.
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
              COST_TYPE = :cost_type
              INFERENCE_GEO = :inference_geo
              MODEL = :model
              PRODUCT = :product
              RBAC_GROUP_ID = :rbac_group_id
              SLACK_CHANNEL_ID = :slack_channel_id
              SPEED = :speed
              TOKEN_TYPE = :token_type

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
