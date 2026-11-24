# typed: strong

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
            sig do
              params(
                case_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewCase
              )
            end
            def retrieve(
              # The ID of the case (`rvc_...`).
              case_id,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
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
            sig do
              params(
                created_at_gt: Time,
                created_at_gte: Time,
                created_at_lt: Time,
                created_at_lte: Time,
                limit: Integer,
                order:
                  Anthropic::Beta::Compliance::BetaComplianceReviewOrder::OrSymbol,
                order_by:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOrderBy::OrSymbol,
                page: String,
                status:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatusFilter::OrSymbol,
                updated_at_gt: Time,
                updated_at_gte: Time,
                updated_at_lt: Time,
                updated_at_lte: Time,
                user_profile_id: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCase
                ]
              )
            end
            def list(
              # Query param: Return only cases whose `created_at` is after this time.
              created_at_gt: nil,
              # Query param: Return only cases whose `created_at` is at or after this time.
              created_at_gte: nil,
              # Query param: Return only cases whose `created_at` is before this time.
              created_at_lt: nil,
              # Query param: Return only cases whose `created_at` is at or before this time.
              created_at_lte: nil,
              # Query param: Number of cases to return per page, between 1 and 100. Defaults
              # to 20.
              limit: nil,
              # Query param: Sort direction, by `order_by` and then by `id`. Defaults to `desc`.
              order: nil,
              # Query param: The field to sort by. Defaults to `created_at`.
              order_by: nil,
              # Query param: Opaque cursor from a previous response's `next_page`. Leave it out
              # to get the first page. A cursor works only with the filters and sort order of
              # the request that returned it.
              page: nil,
              # Query param: Return only cases with this status. Leave it out to get both open
              # and closed cases.
              status: nil,
              # Query param: Return only cases whose `updated_at` is after this time.
              updated_at_gt: nil,
              # Query param: Return cases whose `updated_at` is at or after this time. Cases
              # slightly older than this time are also returned, so that a sync misses no
              # change.
              updated_at_gte: nil,
              # Query param: Return only cases whose `updated_at` is before this time.
              updated_at_lt: nil,
              # Query param: Return only cases whose `updated_at` is at or before this time.
              updated_at_lte: nil,
              # Query param: Return only cases where a message's `user_profile_id` is this ID,
              # including cases that also have messages of other user profiles. A case stops
              # matching once its messages' `user_profile_id` is null. An ID that matches no
              # reachable case returns no cases. A request that sends the
              # `anthropic-user-profile-id` header without this parameter returns a 400 error.
              user_profile_id: nil,
              # Header param: Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
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
            sig do
              params(
                case_id: String,
                determination:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination::OrSymbol,
                policy_categories:
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::OrSymbol
                  ],
                verdicts:
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewVerdictParam::OrHash
                  ],
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewCase
              )
            end
            def respond(
              # Path param: The ID of the case (`rvc_...`).
              case_id,
              # Body param: Your conclusion on the case as a whole. Anthropic doesn't check it
              # against `verdicts`.
              determination:,
              # Body param: The policy categories that you found were violated. Send one to four
              # with `violation`, and none with `no_violation`. They need not match the case's
              # own. Each value is one of `cyber`, `bio`, `chem`, `radnuc` (radiological or
              # nuclear weapons), `cgw` (conventional weapons), `mgw` (military-grade weapons
              # systems), `io` (influence operations), `fraud`, `violent_extremism`,
              # `surveillance`, `human_exploitation`, `self_harm`, `adult_content`,
              # `reasoning_extraction`, `frontier_llm` (use of the model to accelerate frontier
              # AI research and development in restricted ways), `compromised_key` or `other`,
              # and can appear once.
              policy_categories: nil,
              # Body param: Your conclusions on individual messages of the case. They need not
              # cover every message, and each `item_id` can appear once.
              verdicts: nil,
              # Header param: Optional header to specify the beta version(s) you want to use.
              betas: nil,
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
