# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          # @see Anthropic::Resources::Beta::Organization::Analytics::Summaries#list
          class SummaryListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute starting_date
            #   UTC date in YYYY-MM-DD format. Start of the date range (inclusive). Data is
            #   typically available with a 1-day lag (varies by query; the error for a
            #   too-recent date names the latest available day) and may be revised by a few
            #   percent over the following days. No earlier than 2026-01-01.
            #
            #   @return [Date]
            required :starting_date, Date

            # @!attribute ending_date
            #   UTC date in YYYY-MM-DD format. End of the date range (exclusive). Data is
            #   typically available with a 1-day lag, so this can be at most today — which is
            #   also the default when omitted, making the last entry cover the most recent
            #   available day. Data may be revised by a few percent over the following days. The
            #   range may span at most 366 days.
            #
            #   @return [Date, nil]
            optional :ending_date, Date, nil?: true

            # @!attribute filter
            #   Filters as `dimension:value`. Only `rbac_group_id` is supported (e.g.
            #   `filter[]=rbac_group_id:{id}`); repeat the param to OR across groups. Scopes the
            #   whole day series to members of the matching group(s), re-aggregated from
            #   member-level activity — org-wide seat/invite fields and the adoption rates
            #   derived from them are null on scoped rows. `rbac_group_id` accepts the tagged id
            #   (`rbac_group_...`, as emitted in responses and by the spend-limits API) or a
            #   bare group UUID, and matches users who held the group at any point during each
            #   UTC day (time-of-usage attribution). At most 100 entries.
            #
            #   @return [Array<String>, nil]
            optional :filter, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute limit
            #   Number of results per page (1-1000, default 100). The day series (at most 366
            #   entries) is currently returned in full in a single page, so `limit` does not yet
            #   shorten it.
            #
            #   @return [Integer, nil]
            optional :limit, Integer, nil?: true

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page` field. `next_page` is
            #   currently always null, so there is never a cursor to send.
            #
            #   @return [String, nil]
            optional :page, String, nil?: true

            # @!method initialize(starting_date:, ending_date: nil, filter: nil, limit: nil, page: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Analytics::SummaryListParams} for more
            #   details.
            #
            #   @param starting_date [Date] UTC date in YYYY-MM-DD format. Start of the date range (inclusive). Data is typi
            #
            #   @param ending_date [Date, nil] UTC date in YYYY-MM-DD format. End of the date range (exclusive). Data is typica
            #
            #   @param filter [Array<String>, nil] Filters as `dimension:value`. Only `rbac_group_id` is supported (e.g. `filter[]=
            #
            #   @param limit [Integer, nil] Number of results per page (1-1000, default 100). The day series (at most 366 en
            #
            #   @param page [String, nil] Opaque cursor from a previous response's `next_page` field. `next_page` is curre
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
