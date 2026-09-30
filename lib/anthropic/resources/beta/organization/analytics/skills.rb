# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Analytics
          class Skills
            # Get per-skill usage for a given day, with cursor-based pagination.
            #
            # Returns skill usage metrics for the organization, sorted by skill name. Use
            # `group_by[]` to break usage out per member, per RBAC group, or per product
            # surface, and `filter[]` to scope results; the parameter descriptions list the
            # supported dimensions. Available to organizations on a Claude Enterprise plan.
            # Requires an API key with the `read:analytics` scope.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Analytics::SkillListParams} for more
            # details.
            #
            # @overload list(date: nil, ending_date: nil, filter: nil, group_by: nil, limit: nil, order: nil, order_by: nil, page: nil, starting_date: nil, request_options: {})
            #
            # @param date [Date, nil] UTC date in YYYY-MM-DD format. The day to get skill usage for. Data is typically
            #
            # @param ending_date [Date, nil] UTC date in YYYY-MM-DD format. End of the date range (exclusive); only valid wit
            #
            # @param filter [Array<String>, nil] Filters as `dimension:value`, e.g. `filter[]=rbac_group_id:{id}`. Repeat the par
            #
            # @param group_by [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::SkillListParams::GroupBy>, nil] Dimensions to break results out by (e.g. `group_by[]=user_id`). Supported on thi
            #
            # @param limit [Integer, nil] Number of results per page (1-1000, default 100).
            #
            # @param order [Symbol, Anthropic::Models::Beta::Organization::Analytics::SkillListParams::Order, nil] Sort direction: `asc` or `desc`. Defaults to `asc` for the endpoint's sort colum
            #
            # @param order_by [String, nil] Sort field. Restricted to the endpoint's sort column plus its rankable metrics (
            #
            # @param page [String, nil] Opaque cursor from a previous response's `next_page` field.
            #
            # @param starting_date [Date, nil] UTC date in YYYY-MM-DD format. Start of a date range (inclusive). Enables rollup
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaAnalyticsSkillActivity>]
            #
            # @see Anthropic::Models::Beta::Organization::Analytics::SkillListParams
            def list(params = {})
              parsed, options = Anthropic::Beta::Organization::Analytics::SkillListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed)
              @client.request(
                method: :get,
                path: "v1/organizations/analytics/skills?beta=true",
                query: query,
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::BetaAnalyticsSkillActivity,
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
