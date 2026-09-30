# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Analytics
          class CostReport
            # Get cost in USD over time across a date range.
            #
            # Returns cost bucketed by minute, hour, or day, optionally broken down by
            # product, model, context window, inference region, speed, cost type, or token
            # type. Available to organizations on a Claude Enterprise plan. Requires an API
            # key with the `read:analytics` scope.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Analytics::CostReportListParams} for
            # more details.
            #
            # @overload list(starting_at:, bucket_width: nil, claude_tag_categories: nil, claude_tag_user_ids: nil, context_windows: nil, ending_at: nil, group_by: nil, inference_geos: nil, limit: nil, models: nil, page: nil, products: nil, rbac_group_ids: nil, slack_channel_ids: nil, speeds: nil, user_ids: nil, request_options: {})
            #
            # @param starting_at [Time] Start of range, inclusive. RFC 3339 tz-aware. Must be within the last 365 days a
            #
            # @param bucket_width [Symbol, Anthropic::Models::Beta::Organization::Analytics::CostReportListParams::BucketWidth] Time bucket granularity.
            #
            # @param claude_tag_categories [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeTagCategory>, nil] Filter to Claude Tag (Claude in Slack) usage in specific spend categories. Usage
            #
            # @param claude_tag_user_ids [Array<String>, nil] Filter to Claude Tag (Claude in Slack) usage attributed to specific Slack users,
            #
            # @param context_windows [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsContextWindow>, nil] Filter to specific context-window pricing tiers. Use `group_by[]=context_window`
            #
            # @param ending_at [Time, nil] End of range, exclusive. When omitted, defaults to the earlier of now and `start
            #
            # @param group_by [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::CostReportListParams::GroupBy>, nil] Dimensions to break each time bucket out by. Defaults to no grouping (one total
            #
            # @param inference_geos [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsInferenceGeoFilter>, nil] Filter to specific inference regions. `not_available` matches rows where the reg
            #
            # @param limit [Integer, nil] Maximum number of time buckets per page. Defaults and caps vary by `bucket_width
            #
            # @param models [Array<String>, nil] Models to include. Defaults to all models. Use `group_by[]=model` to break out p
            #
            # @param page [String, nil] Opaque cursor from a previous response's `next_page` field.
            #
            # @param products [Array<Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsProductFilter>, nil] Product surfaces to include. Defaults to all products. Use `group_by[]=product`
            #
            # @param rbac_group_ids [Array<String>, nil] Filter to usage attributed to specific RBAC groups. Accepts tagged RBAC group ID
            #
            # @param slack_channel_ids [Array<String>, nil] Filter to usage originating from specific Slack channels. Use `group*by[]=slack*
            #
            # @param speeds [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::CostReportListParams::Speed>, nil] Filter to fast or standard inference mode. Use `group_by[]=speed` to break out p
            #
            # @param user_ids [Array<String>, nil] Filter to specific users by tagged user ID.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaAnalyticsCostReportTimeBucket>]
            #
            # @see Anthropic::Models::Beta::Organization::Analytics::CostReportListParams
            def list(params)
              parsed, options = Anthropic::Beta::Organization::Analytics::CostReportListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed)
              @client.request(
                method: :get,
                path: "v1/organizations/analytics/cost_report?beta=true",
                query: query,
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::BetaAnalyticsCostReportTimeBucket,
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
