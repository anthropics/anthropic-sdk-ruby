# typed: strong

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
            sig do
              params(
                case_id: String,
                created_at_gt: Time,
                created_at_gte: Time,
                created_at_lt: Time,
                created_at_lte: Time,
                limit: Integer,
                order:
                  Anthropic::Beta::Compliance::BetaComplianceReviewOrder::OrSymbol,
                page: String,
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewNotice
                ]
              )
            end
            def list(
              # Query param: Return only notices whose `case_ids` include this case (`rvc_...`).
              # A case that the API key can't read returns an empty list.
              case_id: nil,
              # Query param: Return only notices whose `created_at` is after this time.
              created_at_gt: nil,
              # Query param: Return notices whose `created_at` is at or after this time. Notices
              # slightly older than this time are also returned, so that a poll misses no
              # notice.
              created_at_gte: nil,
              # Query param: Return only notices whose `created_at` is before this time.
              created_at_lt: nil,
              # Query param: Return only notices whose `created_at` is at or before this time.
              created_at_lte: nil,
              # Query param: Number of notices to return per page, between 1 and 100. Defaults
              # to 20.
              limit: nil,
              # Query param: Sort direction, by `created_at` and then by `id`. Defaults to
              # `desc`.
              order: nil,
              # Query param: Opaque cursor from a previous response's `next_page`. Leave it out
              # to get the first page. A cursor works only with the filters and sort order of
              # the request that returned it.
              page: nil,
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
