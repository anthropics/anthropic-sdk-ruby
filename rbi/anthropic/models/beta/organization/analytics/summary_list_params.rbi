# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          class SummaryListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Analytics::SummaryListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # UTC date in YYYY-MM-DD format. Start of the date range (inclusive). Data is
            # typically available with a 1-day lag (varies by query; the error for a
            # too-recent date names the latest available day) and may be revised by a few
            # percent over the following days. No earlier than 2026-01-01.
            sig { returns(Date) }
            attr_accessor :starting_date

            # UTC date in YYYY-MM-DD format. End of the date range (exclusive). Data is
            # typically available with a 1-day lag, so this can be at most today — which is
            # also the default when omitted, making the last entry cover the most recent
            # available day. Data may be revised by a few percent over the following days. The
            # range may span at most 366 days.
            sig { returns(T.nilable(Date)) }
            attr_accessor :ending_date

            # Filters as `dimension:value`. Only `rbac_group_id` is supported (e.g.
            # `filter[]=rbac_group_id:{id}`); repeat the param to OR across groups. Scopes the
            # whole day series to members of the matching group(s), re-aggregated from
            # member-level activity — org-wide seat/invite fields and the adoption rates
            # derived from them are null on scoped rows. `rbac_group_id` accepts the tagged id
            # (`rbac_group_...`, as emitted in responses and by the spend-limits API) or a
            # bare group UUID, and matches users who held the group at any point during each
            # UTC day (time-of-usage attribution). At most 100 entries.
            sig { returns(T.nilable(T::Array[String])) }
            attr_accessor :filter

            # Number of results per page (1-1000, default 100). The day series (at most 366
            # entries) is currently returned in full in a single page, so `limit` does not yet
            # shorten it.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :limit

            # Opaque cursor from a previous response's `next_page` field. `next_page` is
            # currently always null, so there is never a cursor to send.
            sig { returns(T.nilable(String)) }
            attr_accessor :page

            sig do
              params(
                starting_date: Date,
                ending_date: T.nilable(Date),
                filter: T.nilable(T::Array[String]),
                limit: T.nilable(Integer),
                page: T.nilable(String),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # UTC date in YYYY-MM-DD format. Start of the date range (inclusive). Data is
              # typically available with a 1-day lag (varies by query; the error for a
              # too-recent date names the latest available day) and may be revised by a few
              # percent over the following days. No earlier than 2026-01-01.
              starting_date:,
              # UTC date in YYYY-MM-DD format. End of the date range (exclusive). Data is
              # typically available with a 1-day lag, so this can be at most today — which is
              # also the default when omitted, making the last entry cover the most recent
              # available day. Data may be revised by a few percent over the following days. The
              # range may span at most 366 days.
              ending_date: nil,
              # Filters as `dimension:value`. Only `rbac_group_id` is supported (e.g.
              # `filter[]=rbac_group_id:{id}`); repeat the param to OR across groups. Scopes the
              # whole day series to members of the matching group(s), re-aggregated from
              # member-level activity — org-wide seat/invite fields and the adoption rates
              # derived from them are null on scoped rows. `rbac_group_id` accepts the tagged id
              # (`rbac_group_...`, as emitted in responses and by the spend-limits API) or a
              # bare group UUID, and matches users who held the group at any point during each
              # UTC day (time-of-usage attribution). At most 100 entries.
              filter: nil,
              # Number of results per page (1-1000, default 100). The day series (at most 366
              # entries) is currently returned in full in a single page, so `limit` does not yet
              # shorten it.
              limit: nil,
              # Opaque cursor from a previous response's `next_page` field. `next_page` is
              # currently always null, so there is never a cursor to send.
              page: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  starting_date: Date,
                  ending_date: T.nilable(Date),
                  filter: T.nilable(T::Array[String]),
                  limit: T.nilable(Integer),
                  page: T.nilable(String),
                  request_options: Anthropic::RequestOptions
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
