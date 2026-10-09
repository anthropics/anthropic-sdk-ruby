# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Analytics
          class Artifacts
            # Get artifact-creation activity for a given day, broken out by MIME type.
            #
            # Returns the full (`artifact_type`, `is_shared`) cube for the organization;
            # `next_page` is null except for grouped queries, which paginate. The cube can be
            # broken out per product, per member, or per RBAC group via `group_by[]`, and
            # scoped via `filter[]`. Requires an API key with the `read:analytics` scope.
            sig do
              params(
                date: Date,
                filter: T.nilable(T::Array[String]),
                group_by:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::Analytics::ArtifactListParams::GroupBy::OrSymbol
                    ]
                  ),
                limit: T.nilable(Integer),
                page: T.nilable(String),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::BetaAnalyticsArtifactActivity
                ]
              )
            end
            def list(
              # UTC date in YYYY-MM-DD format. The day to get artifact activity for. Data is
              # typically available with a 1-day lag (varies by query; the error for a
              # too-recent date names the latest available day) and may be revised by a few
              # percent over the following days. No earlier than 2026-01-01.
              date:,
              # Filters as `dimension:value`, e.g. `filter[]=rbac_group_id:{id}`. Repeat the
              # param for OR within a dimension and across dimensions for AND. Supported
              # dimensions on this endpoint: `artifact_type`, `is_shared`, `product`,
              # `rbac_group_id`, `user_id`. Value forms: `artifact_type` is a canonical artifact
              # MIME type (e.g. `text/markdown`) or `other`; `is_shared` is `true` or `false`;
              # `product` is `chat_cowork_unified`, `chat`, `claude_code`, or `cowork` (the
              # surfaces that create artifacts); `rbac_group_id` takes the tagged id
              # (`rbac_group_...`, as emitted in responses and by the spend-limits API) or a
              # bare group UUID, and matches users who held the group at any point during each
              # covered UTC day (time-of-usage attribution); `user_id` takes a tagged user id
              # (`user_...`), as emitted in responses. An unsupported dimension returns 400. At
              # most 100 entries. `chat_cowork_unified` is accepted as a `product` value only on
              # deployments that offer Chat and Cowork unified.
              filter: nil,
              # Dimensions to break results out by: `product`, `user_id` and/or `rbac_group_id`.
              # The ungrouped artifact-type cube is finite and returned in full; grouped queries
              # multiply the cube and paginate via `next_page`. `product` takes the values
              # `chat_cowork_unified`, `chat`, `claude_code`, or `cowork` (the surfaces that
              # create artifacts). `rbac_group_id` attributes a user to every group they held at
              # any point during the requested UTC day, so grouped rows are not an exclusive
              # partition. At most 100 entries.
              group_by: nil,
              # Maximum rows to return (1-1000, default 100). The ungrouped artifact-type cube
              # is finite and returned in full; `limit` is the page size only when `group_by[]`
              # multiplies the cube.
              limit: nil,
              # Opaque cursor from a previous response's `next_page` field. Only valid with
              # `group_by[]` — the ungrouped cube is never paginated.
              page: nil,
              request_options: {}
            )
            end

            # @api private
            sig { params(client: Anthropic::Client).returns(T.attached_class) }
            def self.new(client:)
            end
          end
        end
      end
    end
  end
end
