# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      class Analytics
        class Summaries
          # Get organization-wide activity summaries for a date range.
          #
          # Returns one entry per day from `starting_date` (inclusive) to `ending_date`
          # (exclusive) in `data`, the same `data` / `next_page` envelope as the other
          # analytics list endpoints; the series is currently returned in full, so
          # `next_page` is always null. Data is typically available with a 1-day lag and may
          # be revised by a few percent over the following days: when `ending_date` is
          # omitted it defaults to the most recent available day + 1, so the last entry
          # covers the most recent available day. The series can be scoped to an RBAC group
          # via `filter[]=rbac_group_id:{id}`. Available to organizations on a Claude
          # Enterprise plan. Requires an API key with the `read:analytics` scope.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Organization::Analytics::SummaryListParams} for more
          # details.
          #
          # @overload list(starting_date:, ending_date: nil, filter: nil, limit: nil, page: nil, request_options: {})
          #
          # @param starting_date [Date] UTC date in YYYY-MM-DD format. Start of the date range (inclusive). Data is typi
          #
          # @param ending_date [Date, nil] UTC date in YYYY-MM-DD format. End of the date range (exclusive). Data is typica
          #
          # @param filter [Array<String>, nil] Filters as `dimension:value`. Only `rbac_group_id` is supported (e.g. `filter[]=
          #
          # @param limit [Integer, nil] Number of results per page (1-1000, default 100). The day series (at most 366 en
          #
          # @param page [String, nil] Opaque cursor from a previous response's `next_page` field. `next_page` is curre
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Organization::AnalyticsSingleDayActivitySummary>]
          #
          # @see Anthropic::Models::Organization::Analytics::SummaryListParams
          def list(params)
            parsed, options = Anthropic::Organization::Analytics::SummaryListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed)
            @client.request(
              span_name: Anthropic::Internal::Tracing::SpanName::ORGANIZATION_ANALYTICS_SUMMARIES_LIST,
              span_route: "/v1/organizations/analytics/summaries",
              span_query: %w[ending_date filter limit page starting_date],
              method: :get,
              path: "v1/organizations/analytics/summaries",
              query: query,
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Organization::AnalyticsSingleDayActivitySummary,
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
