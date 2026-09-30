# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Analytics
          class Users
            # Get per-user activity for a given day, with cursor-based pagination.
            #
            # Returns activity metrics for each user in the organization, sorted by email
            # address. Use `group_by[]` for per-RBAC-group aggregates, or `filter[]` to scope
            # results to specific members, groups, or a chat project. Available to
            # organizations on a Claude Enterprise plan. Requires an API key with the
            # `read:analytics` scope.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Analytics::UserListParams} for more
            # details.
            #
            # @overload list(date: nil, ending_date: nil, filter: nil, group_by: nil, limit: nil, order: nil, order_by: nil, page: nil, starting_date: nil, request_options: {})
            #
            # @param date [Date, nil] UTC date in YYYY-MM-DD format. The day to get user activity for. Data is typical
            #
            # @param ending_date [Date, nil] UTC date in YYYY-MM-DD format. End of the date range (exclusive); only valid wit
            #
            # @param filter [Array<String>, nil] Filters as `dimension:value`, e.g. `filter[]=rbac_group_id:{id}`. Repeat the par
            #
            # @param group_by [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::UserListParams::GroupBy>, nil] Dimensions to break results out by (e.g. `group_by[]=rbac_group_id`). Supported
            #
            # @param limit [Integer, nil] Number of results per page (1-1000, default 100).
            #
            # @param order [Symbol, Anthropic::Models::Beta::Organization::Analytics::UserListParams::Order, nil] Sort direction: `asc` or `desc`. Defaults to `asc` for the endpoint's sort colum
            #
            # @param order_by [String, nil] Sort field. Restricted to the endpoint's sort column plus its rankable metrics (
            #
            # @param page [String, nil] Opaque cursor from a previous response's `next_page` field.
            #
            # @param starting_date [Date, nil] UTC date in YYYY-MM-DD format. Start of a date range (inclusive). Enables rollup
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaAnalyticsUserActivity>]
            #
            # @see Anthropic::Models::Beta::Organization::Analytics::UserListParams
            def list(params = {})
              parsed, options = Anthropic::Beta::Organization::Analytics::UserListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed)
              @client.request(
                method: :get,
                path: "v1/organizations/analytics/users?beta=true",
                query: query,
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::BetaAnalyticsUserActivity,
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
