# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          class UserUsageReportListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # Start of range, inclusive. RFC 3339 tz-aware. Must be within the last 365 days
            # and no earlier than 2026-01-01T00:00:00Z.
            sig { returns(Time) }
            attr_accessor :starting_at

            # Time-bucket granularity. When set, each row's `starting_at` and `ending_at` are
            # populated and one actor may span several rows (one per time bucket with usage).
            # The time bucket counts toward `limit`, so one page can return multiple rows for
            # the same actor. `ending_at` is required when `bucket_width` is set, and with
            # `bucket_width="1m"` the range may span at most 24 hours. When omitted, each row
            # aggregates the full `[starting_at, ending_at)` range.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::BucketWidth::OrSymbol
                )
              )
            end
            attr_accessor :bucket_width

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

            # If true, omit rows for users who are deleted (`deleted: true`). A page may
            # contain fewer than `limit` rows; use `has_more` and `next_page` to paginate as
            # usual.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :exclude_deleted_users

            sig { params(exclude_deleted_users: T::Boolean).void }
            attr_writer :exclude_deleted_users

            # Break each actor's row out by the given dimensions. Accepts the same values as
            # the bucketed `/usage_report` endpoint. `limit` bounds (actor × time bucket ×
            # dimension) rows — with dimensions or `bucket_width` present, one actor may span
            # several rows.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::OrSymbol
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

            # Number of rows per page (1-1000, default 20). One row per actor unless
            # `group_by[]` or `bucket_width` splits an actor across rows;
            # `cost_type`/`token_type` fan-out rows (cost endpoint only) are the exception —
            # they do not count toward this limit, so `data` can exceed it.
            sig { returns(T.nilable(Integer)) }
            attr_reader :limit

            sig { params(limit: Integer).void }
            attr_writer :limit

            # Models to include. Defaults to all models. Use `group_by[]=model` to break out
            # per-model values.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :models

            # Sort direction. Defaults to `desc`.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Order::OrSymbol
                )
              )
            end
            attr_reader :order

            sig do
              params(
                order:
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Order::OrSymbol
              ).void
            end
            attr_writer :order

            # Metric to rank actors by. Defaults to `total_tokens`.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy::OrSymbol
                )
              )
            end
            attr_reader :order_by

            sig do
              params(
                order_by:
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy::OrSymbol
              ).void
            end
            attr_writer :order_by

            # Opaque cursor from a previous response's `next_page` field.
            sig { returns(T.nilable(String)) }
            attr_accessor :page

            # Product surfaces to include. Defaults to all products.
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
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Speed::OrSymbol
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
                  T.nilable(
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::BucketWidth::OrSymbol
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
                      Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::OrSymbol
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
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Order::OrSymbol,
                order_by:
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy::OrSymbol,
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
                      Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Speed::OrSymbol
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
              # the bucketed `/usage_report` endpoint. `limit` bounds (actor × time bucket ×
              # dimension) rows — with dimensions or `bucket_width` present, one actor may span
              # several rows.
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
              # Metric to rank actors by. Defaults to `total_tokens`.
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

            sig do
              override.returns(
                {
                  starting_at: Time,
                  bucket_width:
                    T.nilable(
                      Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::BucketWidth::OrSymbol
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
                        Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::OrSymbol
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
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Order::OrSymbol,
                  order_by:
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy::OrSymbol,
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
                        Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Speed::OrSymbol
                      ]
                    ),
                  user_ids: T.nilable(T::Array[String]),
                  request_options: Anthropic::RequestOptions
                }
              )
            end
            def to_hash
            end

            # Time-bucket granularity. When set, each row's `starting_at` and `ending_at` are
            # populated and one actor may span several rows (one per time bucket with usage).
            # The time bucket counts toward `limit`, so one page can return multiple rows for
            # the same actor. `ending_at` is required when `bucket_width` is set, and with
            # `bucket_width="1m"` the range may span at most 24 hours. When omitted, each row
            # aggregates the full `[starting_at, ending_at)` range.
            module BucketWidth
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::BucketWidth
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DAY =
                T.let(
                  :"1d",
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::BucketWidth::TaggedSymbol
                )
              HOUR =
                T.let(
                  :"1h",
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::BucketWidth::TaggedSymbol
                )
              MINUTE =
                T.let(
                  :"1m",
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::BucketWidth::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::BucketWidth::TaggedSymbol
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
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              CLAUDE_TAG_CATEGORY =
                T.let(
                  :claude_tag_category,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::TaggedSymbol
                )
              CLAUDE_TAG_USER_ID =
                T.let(
                  :claude_tag_user_id,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::TaggedSymbol
                )
              CONTEXT_WINDOW =
                T.let(
                  :context_window,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::TaggedSymbol
                )
              INFERENCE_GEO =
                T.let(
                  :inference_geo,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::TaggedSymbol
                )
              MODEL =
                T.let(
                  :model,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::TaggedSymbol
                )
              PRODUCT =
                T.let(
                  :product,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::TaggedSymbol
                )
              RBAC_GROUP_ID =
                T.let(
                  :rbac_group_id,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::TaggedSymbol
                )
              SLACK_CHANNEL_ID =
                T.let(
                  :slack_channel_id,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::TaggedSymbol
                )
              SPEED =
                T.let(
                  :speed,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::GroupBy::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Sort direction. Defaults to `desc`.
            module Order
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Order
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ASC =
                T.let(
                  :asc,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Order::TaggedSymbol
                )
              DESC =
                T.let(
                  :desc,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Order::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Order::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Metric to rank actors by. Defaults to `total_tokens`.
            module OrderBy
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              OUTPUT_TOKENS =
                T.let(
                  :output_tokens,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy::TaggedSymbol
                )
              REQUESTS =
                T.let(
                  :requests,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy::TaggedSymbol
                )
              TOTAL_TOKENS =
                T.let(
                  :total_tokens,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy::TaggedSymbol
                )
              UNCACHED_INPUT_TOKENS =
                T.let(
                  :uncached_input_tokens,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::OrderBy::TaggedSymbol
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
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Speed
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FAST =
                T.let(
                  :fast,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Speed::TaggedSymbol
                )
              STANDARD =
                T.let(
                  :standard,
                  Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Speed::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Analytics::UserUsageReportListParams::Speed::TaggedSymbol
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
