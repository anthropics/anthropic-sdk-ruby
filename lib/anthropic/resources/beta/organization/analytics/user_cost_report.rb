# frozen_string_literal: true

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
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Analytics::UserCostReportListParams} for
            # more details.
            #
            # @overload list(starting_at:, bucket_width: nil, claude_tag_categories: nil, claude_tag_user_ids: nil, context_windows: nil, ending_at: nil, exclude_deleted_users: nil, group_by: nil, inference_geos: nil, limit: nil, models: nil, order: nil, order_by: nil, page: nil, products: nil, rbac_group_ids: nil, slack_channel_ids: nil, speeds: nil, user_ids: nil, request_options: {})
            #
            # @param starting_at [Time] Start of range, inclusive. RFC 3339 tz-aware. Must be within the last 365 days a
            #
            # @param bucket_width [Symbol, Anthropic::Models::Beta::Organization::Analytics::UserCostReportListParams::BucketWidth, nil] Time-bucket granularity. When set, each row's `starting_at` and `ending_at` are
            #
            # @param claude_tag_categories [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeTagCategory>, nil] Filter to Claude Tag (Claude in Slack) usage in specific spend categories. Usage
            #
            # @param claude_tag_user_ids [Array<String>, nil] Filter to Claude Tag (Claude in Slack) usage attributed to specific Slack users,
            #
            # @param context_windows [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsContextWindow>, nil] Filter to specific context-window pricing tiers. Use `group_by[]=context_window`
            #
            # @param ending_at [Time, nil] End of range, exclusive. When omitted, defaults to the earlier of now and `start
            #
            # @param exclude_deleted_users [Boolean] If true, omit rows for users who are deleted (`deleted: true`). A page may conta
            #
            # @param group_by [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::UserCostReportListParams::GroupBy>, nil] Break each actor's row out by the given dimensions. Accepts the same values as t
            #
            # @param inference_geos [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsInferenceGeoFilter>, nil] Filter to specific inference regions. `not_available` matches rows where the reg
            #
            # @param limit [Integer] Number of rows per page (1-1000, default 20). One row per actor unless `group_by
            #
            # @param models [Array<String>, nil] Models to include. Defaults to all models. Use `group_by[]=model` to break out p
            #
            # @param order [Symbol, Anthropic::Models::Beta::Organization::Analytics::UserCostReportListParams::Order] Sort direction. Defaults to `desc`.
            #
            # @param order_by [Symbol, Anthropic::Models::Beta::Organization::Analytics::UserCostReportListParams::OrderBy] Metric to rank actors by. Defaults to `amount`.
            #
            # @param page [String, nil] Opaque cursor from a previous response's `next_page` field.
            #
            # @param products [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsProductFilter>, nil] Product surfaces to include. Defaults to all products.
            #
            # @param rbac_group_ids [Array<String>, nil] Filter to usage attributed to specific RBAC groups. Accepts tagged RBAC group ID
            #
            # @param slack_channel_ids [Array<String>, nil] Filter to usage originating from specific Slack channels. Use `group*by[]=slack*
            #
            # @param speeds [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::UserCostReportListParams::Speed>, nil] Filter to fast or standard inference mode. Use `group_by[]=speed` to break out p
            #
            # @param user_ids [Array<String>, nil] Filter to specific users by tagged user ID.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaAnalyticsCostUsersItem>]
            #
            # @see Anthropic::Models::Beta::Organization::Analytics::UserCostReportListParams
            def list(params)
              parsed, options = Anthropic::Beta::Organization::Analytics::UserCostReportListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed)
              @client.request(
                method: :get,
                path: "v1/organizations/analytics/user_cost_report?beta=true",
                query: query,
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::BetaAnalyticsCostUsersItem,
                options: options
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
