# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Compliance
        class Review
          class Notices
            # List Anthropic's notices to the organizations that the API key can reach, newest
            # first by default. A notice is returned only if the API key can read every case
            # in its `case_ids`.
            #
            # To poll, store the largest `created_at` you have read, and send it as the
            # at-or-after filter on `created_at`. Read every page, match results by `id`, and
            # store the new largest value after the last page.
            #
            # An Admin API key with the `read:compliance_review_cases` scope can call this
            # endpoint.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Compliance::Review::NoticeListParams} for more
            # details.
            #
            # @overload list(case_id: nil, created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, limit: nil, order: nil, page: nil, betas: nil, request_options: {})
            #
            # @param case_id [String] Query param: Return only notices whose `case_ids` include this case (`rvc_...`).
            #
            # @param created_at_gt [Time] Query param: Return only notices whose `created_at` is after this time.
            #
            # @param created_at_gte [Time] Query param: Return notices whose `created_at` is at or after this time. Notices
            #
            # @param created_at_lt [Time] Query param: Return only notices whose `created_at` is before this time.
            #
            # @param created_at_lte [Time] Query param: Return only notices whose `created_at` is at or before this time.
            #
            # @param limit [Integer] Query param: Number of notices to return per page, between 1 and 100. Defaults t
            #
            # @param order [Symbol, Anthropic::Models::Beta::Compliance::BetaComplianceReviewOrder] Query param: Sort direction, by `created_at` and then by `id`. Defaults to
            #
            # @param page [String] Query param: Opaque cursor from a previous response's `next_page`. Leave it out
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewNotice>]
            #
            # @see Anthropic::Models::Beta::Compliance::Review::NoticeListParams
            def list(params = {})
              query_params =
                [
                  :case_id,
                  :created_at_gt,
                  :created_at_gte,
                  :created_at_lt,
                  :created_at_lte,
                  :limit,
                  :order,
                  :page
                ]
              parsed, options = Anthropic::Beta::Compliance::Review::NoticeListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::COMPLIANCE_REVIEW_NOTICES_LIST,
                span_route: "/v1/compliance/review/notices",
                span_query: %w[
                  case_id
                  created_at[gt]
                  created_at[gte]
                  created_at[lt]
                  created_at[lte]
                  limit
                  order
                  page
                ],
                method: :get,
                path: "v1/compliance/review/notices",
                query: query.transform_keys(
                  created_at_gt: "created_at[gt]",
                  created_at_gte: "created_at[gte]",
                  created_at_lt: "created_at[lt]",
                  created_at_lte: "created_at[lte]"
                ),
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Compliance::Review::BetaComplianceReviewNotice,
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
