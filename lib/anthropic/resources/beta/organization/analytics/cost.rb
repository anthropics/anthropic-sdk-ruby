# frozen_string_literal: true

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
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Analytics::CostListParams} for more
            # details.
            #
            # @overload list(starting_at:, actor_ids: nil, actor_types: nil, agent_ids: nil, api_key_ids: nil, claude_tag_categories: nil, claude_tag_user_ids: nil, context_windows: nil, deployment_ids: nil, ending_at: nil, environment_ids: nil, exclude_deleted_users: nil, group_by: nil, inference_geos: nil, limit: nil, models: nil, order: nil, order_by: nil, page: nil, products: nil, rbac_group_ids: nil, service_tiers: nil, session_ids: nil, slack_channel_ids: nil, speeds: nil, time_bucket_width: nil, user_profile_ids: nil, workspace_ids: nil, betas: nil, request_options: {})
            #
            # @param starting_at [Time] Query param: Start of range, inclusive. RFC 3339 tz-aware. Must be within the la
            #
            # @param actor_ids [Array<String>, nil] Query param: Filter to usage attributed to specific identities, by tagged ID: a
            #
            # @param actor_types [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsActorType>, nil] Query param: Filter to usage attributed to specific kinds of identity. Use `grou
            #
            # @param agent_ids [Array<String>, nil] Query param: Filter to usage incurred by sessions of specific Claude Managed Age
            #
            # @param api_key_ids [Array<String>, nil] Query param: Filter to usage authenticated by specific API keys, by tagged API k
            #
            # @param claude_tag_categories [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeTagCategory>, nil] Query param: Filter to Claude Tag (Claude in Slack) usage in specific spend cate
            #
            # @param claude_tag_user_ids [Array<String>, nil] Query param: Filter to Claude Tag (Claude in Slack) usage attributed to specific
            #
            # @param context_windows [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsContextWindow>, nil] Query param: Filter to specific context-window pricing tiers. Use `group_by[]=co
            #
            # @param deployment_ids [Array<String>, nil] Query param: Filter to usage incurred by Claude Managed Agents sessions that spe
            #
            # @param ending_at [Time, nil] Query param: End of range, exclusive. Required when `time_bucket_width` is set.
            #
            # @param environment_ids [Array<String>, nil] Query param: Filter to usage incurred by Claude Managed Agents sessions that ran
            #
            # @param exclude_deleted_users [Boolean] Query param: If true, omit rows whose `actor` is a `user_actor` with `deleted: t
            #
            # @param group_by [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy>, nil] Query param: Dimensions to break cost out by (at most 5, not counting `cost_type
            #
            # @param inference_geos [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsInferenceGeoFilter>, nil] Query param: Filter to specific inference regions. `not_available` matches rows
            #
            # @param limit [Integer] Query param: Number of rows per page (1-1000, default 20). `cost_type`/`token_ty
            #
            # @param models [Array<String>, nil] Query param: Models to include. Defaults to all models. Use `group_by[]=model` t
            #
            # @param order [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsUsageCostSortOrder] Query param: Sort direction of the `order_by` metric, or of the time buckets whe
            #
            # @param order_by [Symbol, Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostOrderBy] Query param: Row order. A metric ranks rows by that metric in the `order` direct
            #
            # @param page [String, nil] Query param: Opaque cursor from a previous response's `next_page` field.
            #
            # @param products [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsUsageCostProductFilter>, nil] Query param: Product surfaces to include. Defaults to all products.
            #
            # @param rbac_group_ids [Array<String>, nil] Query param: Filter to usage attributed to specific RBAC groups. Accepts tagged
            #
            # @param service_tiers [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsServiceTier>, nil] Query param: Filter to specific service tiers. Use `group_by[]=service_tier` to
            #
            # @param session_ids [Array<String>, nil] Query param: Filter to usage incurred by specific Claude Managed Agents sessions
            #
            # @param slack_channel_ids [Array<String>, nil] Query param: Filter to usage originating from specific Slack channels. Use `grou
            #
            # @param speeds [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsSpeed>, nil] Query param: Filter to fast or standard inference mode. Use `group_by[]=speed` t
            #
            # @param time_bucket_width [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsTimeBucketWidth, nil] Query param: Time-bucket granularity. When set, rows are returned per time bucke
            #
            # @param user_profile_ids [Array<String>, nil] Query param: Filter to usage attributed to specific user profiles, by tagged use
            #
            # @param workspace_ids [Array<String>, nil] Query param: Filter to usage in specific workspaces, by tagged workspace ID (`wr
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: This endpoint is in beta: requests must send `analytics-usage-cost
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::ReportPageCursor<Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostItem>]
            #
            # @see Anthropic::Models::Beta::Organization::Analytics::CostListParams
            def list(params)
              query_params =
                [
                  :starting_at,
                  :actor_ids,
                  :actor_types,
                  :agent_ids,
                  :api_key_ids,
                  :claude_tag_categories,
                  :claude_tag_user_ids,
                  :context_windows,
                  :deployment_ids,
                  :ending_at,
                  :environment_ids,
                  :exclude_deleted_users,
                  :group_by,
                  :inference_geos,
                  :limit,
                  :models,
                  :order,
                  :order_by,
                  :page,
                  :products,
                  :rbac_group_ids,
                  :service_tiers,
                  :session_ids,
                  :slack_channel_ids,
                  :speeds,
                  :time_bucket_width,
                  :user_profile_ids,
                  :workspace_ids
                ]
              parsed, options = Anthropic::Beta::Organization::Analytics::CostListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_ANALYTICS_COST_LIST,
                span_route: "/v1/organizations/analytics/cost",
                span_query: %w[
                  actor_ids
                  actor_types
                  agent_ids
                  api_key_ids
                  claude_tag_categories
                  claude_tag_user_ids
                  context_windows
                  deployment_ids
                  ending_at
                  environment_ids
                  exclude_deleted_users
                  group_by
                  inference_geos
                  limit
                  models
                  order
                  order_by
                  page
                  products
                  rbac_group_ids
                  service_tiers
                  session_ids
                  slack_channel_ids
                  speeds
                  starting_at
                  time_bucket_width
                  user_profile_ids
                  workspace_ids
                ],
                method: :get,
                path: "v1/organizations/analytics/cost?beta=true",
                query: query,
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::ReportPageCursor,
                model: Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostItem,
                options: {extra_headers: {"anthropic-beta" => "analytics-usage-cost-2026-08-24"}, **options}
              )
            end

            # @api private
            #
            # @param client [Anthropic::Client]
            def initialize(client:)
              @client = client
            end
          end
        end
      end
    end
  end
end
