# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          class UsageReportListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # Start of range, inclusive. RFC 3339 tz-aware. Must be within the last 365 days
            # and no earlier than 2026-01-01T00:00:00Z.
            sig { returns(Time) }
            attr_accessor :starting_at

            # Time bucket granularity.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::BucketWidth::OrSymbol
                )
              )
            end
            attr_reader :bucket_width

            sig do
              params(
                bucket_width:
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::BucketWidth::OrSymbol
              ).void
            end
            attr_writer :bucket_width

            # Filter to Claude Tag (Claude in Slack) usage in specific spend categories. Usage
            # with no category never matches. `dm` usage is reported under the user's product
            # rather than `claude-tag`, so combining this filter with `products[]=claude-tag`
            # excludes it. Use `group_by[]=claude_tag_category` to break out per-category
            # values.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::OrSymbol
                  ]
                )
              )
            end
            attr_accessor :claude_tag_categories

            # Filter to Claude Tag (Claude in Slack) usage attributed to specific Slack users,
            # by Slack user ID (for example `U0123ABCDEF`), not claude.ai user ID. Usage that
            # is not Claude Tag, and Claude Tag usage not attributed to a single user, never
            # matches. Use `group_by[]=claude_tag_user_id` to break out per-user values.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :claude_tag_user_ids

            # Filter to specific context-window pricing tiers. Use `group_by[]=context_window`
            # to break out per-tier values.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Organization::BetaAnalyticsContextWindow::OrSymbol
                  ]
                )
              )
            end
            attr_accessor :context_windows

            # End of range, exclusive. When omitted, defaults to the earlier of now and
            # `starting_at` + 31 days. The range may span at most 31 days.
            sig { returns(T.nilable(Time)) }
            attr_accessor :ending_at

            # Dimensions to break each time bucket out by. Defaults to no grouping (one total
            # per bucket). Each bucket reports at most its top 100 groups; a group beyond that
            # cap has no row in that bucket (there is no remainder row), so grouped buckets
            # are not exhaustive when a dimension has more than 100 distinct values.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy::OrSymbol
                  ]
                )
              )
            end
            attr_accessor :group_by

            # Filter to specific inference regions. `not_available` matches rows where the
            # region is unset. Use `group_by[]=inference_geo` to break out per-region values.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Organization::BetaAnalyticsInferenceGeoFilter::OrSymbol
                  ]
                )
              )
            end
            attr_accessor :inference_geos

            # Maximum number of time buckets per page. Defaults and caps vary by
            # `bucket_width` (`1d`: default 7, max 31; `1h`: default 24, max 168; `1m`:
            # default 60, max 256).
            sig { returns(T.nilable(Integer)) }
            attr_accessor :limit

            # Models to include. Defaults to all models. Use `group_by[]=model` to break out
            # per-model values.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :models

            # Opaque cursor from a previous response's `next_page` field.
            sig { returns(T.nilable(String)) }
            attr_accessor :page

            # Product surfaces to include. Defaults to all products. Use `group_by[]=product`
            # to break out per-product values.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Organization::BetaAnalyticsProductFilter::OrSymbol
                  ]
                )
              )
            end
            attr_accessor :products

            # Filter to usage attributed to specific RBAC groups. Accepts tagged RBAC group
            # IDs (`rbac_group_...`) or bare group UUIDs. A row matches when the user belonged
            # to any of the listed groups on the (UTC) day the usage occurred; usage with no
            # group attribution never matches.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :rbac_group_ids

            # Filter to usage originating from specific Slack channels. Use
            # `group_by[]=slack_channel_id` to break out per-channel values.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :slack_channel_ids

            # Filter to fast or standard inference mode. Use `group_by[]=speed` to break out
            # per-mode values.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::UsageReportListParams::Speed::OrSymbol
                  ]
                )
              )
            end
            attr_accessor :speeds

            # Filter to specific users by tagged user ID.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :user_ids

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
              ).returns(T.attached_class)
            end
            def self.new(
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

            sig do
              override.returns(
                {
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
                  request_options: Anthropic::RequestOptions
                }
              )
            end
            def to_hash
            end

            # Time bucket granularity.
            module BucketWidth
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::Analytics::UsageReportListParams::BucketWidth
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DAY =
                T.let(
                  :"1d",
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::BucketWidth::TaggedSymbol
                )
              HOUR =
                T.let(
                  :"1h",
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::BucketWidth::TaggedSymbol
                )
              MINUTE =
                T.let(
                  :"1m",
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::BucketWidth::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::UsageReportListParams::BucketWidth::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module GroupBy
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              CLAUDE_TAG_CATEGORY =
                T.let(
                  :claude_tag_category,
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy::TaggedSymbol
                )
              CLAUDE_TAG_USER_ID =
                T.let(
                  :claude_tag_user_id,
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy::TaggedSymbol
                )
              CONTEXT_WINDOW =
                T.let(
                  :context_window,
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy::TaggedSymbol
                )
              INFERENCE_GEO =
                T.let(
                  :inference_geo,
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy::TaggedSymbol
                )
              MODEL =
                T.let(
                  :model,
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy::TaggedSymbol
                )
              PRODUCT =
                T.let(
                  :product,
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy::TaggedSymbol
                )
              RBAC_GROUP_ID =
                T.let(
                  :rbac_group_id,
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy::TaggedSymbol
                )
              SLACK_CHANNEL_ID =
                T.let(
                  :slack_channel_id,
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy::TaggedSymbol
                )
              SPEED =
                T.let(
                  :speed,
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::UsageReportListParams::GroupBy::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            module Speed
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::Analytics::UsageReportListParams::Speed
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FAST =
                T.let(
                  :fast,
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::Speed::TaggedSymbol
                )
              STANDARD =
                T.let(
                  :standard,
                  Anthropic::Beta::Organization::Analytics::UsageReportListParams::Speed::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::UsageReportListParams::Speed::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end
    end
  end
end
