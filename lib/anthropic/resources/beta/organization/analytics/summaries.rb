# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
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
            # {Anthropic::Models::Beta::Organization::Analytics::SummaryListParams} for more
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
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaAnalyticsSingleDayActivitySummary>]
            #
            # @see Anthropic::Models::Beta::Organization::Analytics::SummaryListParams
            def list(params)
              parsed, options = Anthropic::Beta::Organization::Analytics::SummaryListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed)
              @client.request(
                method: :get,
                path: "v1/organizations/analytics/summaries?beta=true",
                query: query,
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::BetaAnalyticsSingleDayActivitySummary,
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
