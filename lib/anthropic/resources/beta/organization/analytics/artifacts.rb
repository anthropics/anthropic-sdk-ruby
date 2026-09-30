# frozen_string_literal: true

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
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::Analytics::ArtifactListParams} for more
            # details.
            #
            # @overload list(date:, filter: nil, group_by: nil, limit: nil, page: nil, request_options: {})
            #
            # @param date [Date] UTC date in YYYY-MM-DD format. The day to get artifact activity for. Data is typ
            #
            # @param filter [Array<String>, nil] Filters as `dimension:value`, e.g. `filter[]=rbac_group_id:{id}`. Repeat the par
            #
            # @param group_by [Array<Symbol, Anthropic::Models::Beta::Organization::Analytics::ArtifactListParams::GroupBy>, nil] Dimensions to break results out by: `product`, `user_id` and/or `rbac_group_id`.
            #
            # @param limit [Integer, nil] Maximum rows to return (1-1000, default 100). The ungrouped artifact-type cube i
            #
            # @param page [String, nil] Opaque cursor from a previous response's `next_page` field. Only valid with `gro
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaAnalyticsArtifactActivity>]
            #
            # @see Anthropic::Models::Beta::Organization::Analytics::ArtifactListParams
            def list(params)
              parsed, options = Anthropic::Beta::Organization::Analytics::ArtifactListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed)
              @client.request(
                method: :get,
                path: "v1/organizations/analytics/artifacts?beta=true",
                query: query,
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::BetaAnalyticsArtifactActivity,
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
