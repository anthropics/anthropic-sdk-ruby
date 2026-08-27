# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class RateLimits
          # List Messages API rate limits for your organization.
          #
          # Each entry corresponds to one rate-limit group (either a model family or an
          # API-surface category such as the Files API or Message Batches) and contains the
          # set of limiter values that apply to it.
          #
          # When `limit` is omitted, every matching entry is returned in a single page; when
          # `limit` truncates the result, follow `next_page` to fetch the remaining entries.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::RateLimitListParams} for more details.
          #
          # @overload list(group_type: nil, limit: nil, model: nil, page: nil, request_options: {})
          #
          # @param group_type [Symbol, Anthropic::Models::Beta::Organization::RateLimitListParams::GroupType, nil] Filter by group type.
          #
          # @param limit [Integer, nil] Maximum number of items to return per page. Ranges from `1` to `1000`.
          #
          # @param model [String, nil] Filter to the single entry containing this model. Accepts full model names and a
          #
          # @param page [String, nil] Opaque cursor from a previous response's `next_page`.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::BetaOrganizationRateLimit>]
          #
          # @see Anthropic::Models::Beta::Organization::RateLimitListParams
          def list(params = {})
            parsed, options = Anthropic::Beta::Organization::RateLimitListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: "v1/organizations/rate_limits?beta=true",
              query: query,
              page: Anthropic::Internal::PageCursor,
              model: Anthropic::Beta::Organization::BetaOrganizationRateLimit,
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
