# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Compliance
        class Review
          class Cases
            # Read one review case.
            #
            # A case that the API key can't reach, or that Anthropic hasn't sent, returns the
            # same 404 as a case that doesn't exist.
            #
            # An Admin API key with the `read:compliance_review_cases` scope can call this
            # endpoint.
            #
            # @overload retrieve(case_id, betas: nil, request_options: {})
            #
            # @param case_id [String] The ID of the case (`rvc_...`).
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCase]
            #
            # @see Anthropic::Models::Beta::Compliance::Review::CaseRetrieveParams
            def retrieve(case_id, params = {})
              parsed, options = Anthropic::Beta::Compliance::Review::CaseRetrieveParams.dump_request(params)
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::COMPLIANCE_REVIEW_CASES_RETRIEVE,
                span_attributes: {"anthropic.compliance.review.case.id" => case_id},
                span_route: "/v1/compliance/review/cases/{case_id}",
                method: :get,
                path: ["v1/compliance/review/cases/%1$s", case_id],
                headers: parsed.transform_keys(betas: "anthropic-beta"),
                model: Anthropic::Beta::Compliance::Review::BetaComplianceReviewCase,
                options: options
              )
            end

            # List the review cases of every organization that the API key can reach, newest
            # first by default. Both open and closed cases are returned unless `status` is
            # set.
            #
            # To sync, store the largest `updated_at` you have read, and send it as the
            # at-or-after filter on `updated_at`, sorted by `updated_at` ascending. That finds
            # new cases, newly closed cases, and cases with a new notice. Read every page,
            # match results by `id`, and store the new largest value after the last page.
            #
            # A request with the `anthropic-user-profile-id` header and no `user_profile_id`
            # parameter returns a 400 error.
            #
            # An Admin API key with the `read:compliance_review_cases` scope can call this
            # endpoint.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Compliance::Review::CaseListParams} for more details.
            #
            # @overload list(created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, limit: nil, order: nil, order_by: nil, page: nil, status: nil, updated_at_gt: nil, updated_at_gte: nil, updated_at_lt: nil, updated_at_lte: nil, user_profile_id: nil, betas: nil, request_options: {})
            #
            # @param created_at_gt [Time] Query param: Return only cases whose `created_at` is after this time.
            #
            # @param created_at_gte [Time] Query param: Return only cases whose `created_at` is at or after this time.
            #
            # @param created_at_lt [Time] Query param: Return only cases whose `created_at` is before this time.
            #
            # @param created_at_lte [Time] Query param: Return only cases whose `created_at` is at or before this time.
            #
            # @param limit [Integer] Query param: Number of cases to return per page, between 1 and 100. Defaults to
            #
            # @param order [Symbol, Anthropic::Models::Beta::Compliance::BetaComplianceReviewOrder] Query param: Sort direction, by `order_by` and then by `id`. Defaults to `desc`.
            #
            # @param order_by [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseOrderBy] Query param: The field to sort by. Defaults to `created_at`.
            #
            # @param page [String] Query param: Opaque cursor from a previous response's `next_page`. Leave it out
            #
            # @param status [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseStatusFilter] Query param: Return only cases with this status. Leave it out to get both open a
            #
            # @param updated_at_gt [Time] Query param: Return only cases whose `updated_at` is after this time.
            #
            # @param updated_at_gte [Time] Query param: Return cases whose `updated_at` is at or after this time. Cases sli
            #
            # @param updated_at_lt [Time] Query param: Return only cases whose `updated_at` is before this time.
            #
            # @param updated_at_lte [Time] Query param: Return only cases whose `updated_at` is at or before this time.
            #
            # @param user_profile_id [String] Query param: Return only cases where a message's `user_profile_id` is this ID, i
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCase>]
            #
            # @see Anthropic::Models::Beta::Compliance::Review::CaseListParams
            def list(params = {})
              query_params =
                [
                  :created_at_gt,
                  :created_at_gte,
                  :created_at_lt,
                  :created_at_lte,
                  :limit,
                  :order,
                  :order_by,
                  :page,
                  :status,
                  :updated_at_gt,
                  :updated_at_gte,
                  :updated_at_lt,
                  :updated_at_lte,
                  :user_profile_id
                ]
              parsed, options = Anthropic::Beta::Compliance::Review::CaseListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::COMPLIANCE_REVIEW_CASES_LIST,
                span_route: "/v1/compliance/review/cases",
                span_query: %w[
                  created_at[gt]
                  created_at[gte]
                  created_at[lt]
                  created_at[lte]
                  limit
                  order
                  order_by
                  page
                  status
                  updated_at[gt]
                  updated_at[gte]
                  updated_at[lt]
                  updated_at[lte]
                  user_profile_id
                ],
                method: :get,
                path: "v1/compliance/review/cases",
                query: query.transform_keys(
                  created_at_gt: "created_at[gt]",
                  created_at_gte: "created_at[gte]",
                  created_at_lt: "created_at[lt]",
                  created_at_lte: "created_at[lte]",
                  updated_at_gt: "updated_at[gt]",
                  updated_at_gte: "updated_at[gte]",
                  updated_at_lt: "updated_at[lt]",
                  updated_at_lte: "updated_at[lte]"
                ),
                headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Compliance::Review::BetaComplianceReviewCase,
                options: options
              )
            end

            # Send your conclusion on a review case. A response closes the case, and a closed
            # case can't be reopened.
            #
            # Only the first response counts. A request is safe to send again: if the closed
            # case has a response with the same field values, in any list order, the API
            # returns 200 and changes nothing. If the closed case has a different response, or
            # none, the API returns a 400 with `case_closed` in `error.details.error_code`.
            #
            # If your end customer reviews this case instead of you, the API returns a 403
            # with `case_reviewed_by_end_customer` in `error.details.error_code`.
            #
            # An Admin API key with the `write:compliance_review_cases` scope can call this
            # endpoint.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Compliance::Review::CaseRespondParams} for more
            # details.
            #
            # @overload respond(case_id, determination:, policy_categories: nil, verdicts: nil, betas: nil, request_options: {})
            #
            # @param case_id [String] Path param: The ID of the case (`rvc_...`).
            #
            # @param determination [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewDetermination] Body param: Your conclusion on the case as a whole. Anthropic doesn't check it a
            #
            # @param policy_categories [Array<Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory>] Body param: The policy categories that you found were violated. Send one to four
            #
            # @param verdicts [Array<Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewVerdictParam>] Body param: Your conclusions on individual messages of the case. They need not c
            #
            # @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCase]
            #
            # @see Anthropic::Models::Beta::Compliance::Review::CaseRespondParams
            def respond(case_id, params)
              parsed, options = Anthropic::Beta::Compliance::Review::CaseRespondParams.dump_request(params)
              header_params = {betas: "anthropic-beta"}
              @client.request(
                qualifiers: {beta: "true"},
                span_name: Anthropic::Internal::Tracing::SpanName::COMPLIANCE_REVIEW_CASES_RESPOND,
                span_attributes: {"anthropic.compliance.review.case.id" => case_id},
                span_route: "/v1/compliance/review/cases/{case_id}/respond",
                method: :post,
                path: ["v1/compliance/review/cases/%1$s/respond", case_id],
                headers: parsed.slice(*header_params.keys).transform_keys(header_params),
                body: parsed.except(*header_params.keys),
                model: Anthropic::Beta::Compliance::Review::BetaComplianceReviewCase,
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
