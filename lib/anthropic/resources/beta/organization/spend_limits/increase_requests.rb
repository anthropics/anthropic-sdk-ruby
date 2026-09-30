# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class SpendLimits
          class IncreaseRequests
            # Retrieve a spend limit increase request.
            #
            # While `pending`, the response includes a live `spend_summary` for the requester
            # at the request's period.
            #
            # @overload retrieve(spend_limit_increase_request_id, request_options: {})
            #
            # @param spend_limit_increase_request_id [String] ID of the spend limit increase request.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequest]
            #
            # @see Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestRetrieveParams
            def retrieve(spend_limit_increase_request_id, params = {})
              @client.request(
                method: :get,
                path: [
                  "v1/organizations/spend_limit_increase_requests/%1$s?beta=true",
                  spend_limit_increase_request_id
                ],
                model: Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequest,
                options: params[:request_options]
              )
            end

            # List spend limit increase requests, most recent first.
            #
            # Pending requests include a live `spend_summary` for the requester. Requests
            # whose requester is no longer a member are excluded.
            #
            # @overload list(actor_ids: nil, limit: nil, page: nil, status: nil, request_options: {})
            #
            # @param actor_ids [Array<String>, nil] Filter by requester, as `user_...` tagged IDs.
            #
            # @param limit [Integer]
            #
            # @param page [String, nil] Opaque cursor from a previous response's `next_page`.
            #
            # @param status [Array<Symbol, Anthropic::Models::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus>, nil] Filter by status. Omit to return all.
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequest>]
            #
            # @see Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestListParams
            def list(params = {})
              parsed, options =
                Anthropic::Beta::Organization::SpendLimits::IncreaseRequestListParams.dump_request(params)
              query = Anthropic::Internal::Util.encode_query_params(parsed)
              @client.request(
                method: :get,
                path: "v1/organizations/spend_limit_increase_requests?beta=true",
                query: query,
                page: Anthropic::Internal::PageCursor,
                model: Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequest,
                options: options
              )
            end

            # Approve a pending spend limit increase request.
            #
            # Writes a per-user spend limit at `amount` for the requester and transitions the
            # request to `approved`. `period` defaults to the period the member was blocked
            # on. Anthropic emails the requester unless `suppress_notification` is set.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveParams}
            # for more details.
            #
            # @overload approve(spend_limit_increase_request_id, amount:, period: nil, suppress_notification: nil, request_options: {})
            #
            # @param spend_limit_increase_request_id [String] ID of the spend limit increase request.
            #
            # @param amount [String] New per-user spend limit as a non-negative integer decimal string (minor units).
            #
            # @param period [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod, nil]
            #
            # @param suppress_notification [Boolean]
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse]
            #
            # @see Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveParams
            def approve(spend_limit_increase_request_id, params)
              parsed, options =
                Anthropic::Beta::Organization::SpendLimits::IncreaseRequestApproveParams.dump_request(params)
              @client.request(
                method: :post,
                path: [
                  "v1/organizations/spend_limit_increase_requests/%1$s/approve?beta=true",
                  spend_limit_increase_request_id
                ],
                body: parsed,
                model: Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse,
                options: options
              )
            end

            # Deny a pending spend limit increase request.
            #
            # Idempotent on `denied`; denying an already-`approved` request returns 400.
            # Anthropic emails the requester unless `suppress_notification` is set.
            #
            # @overload deny(spend_limit_increase_request_id, suppress_notification: nil, request_options: {})
            #
            # @param spend_limit_increase_request_id [String] ID of the spend limit increase request.
            #
            # @param suppress_notification [Boolean]
            #
            # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
            #
            # @return [Anthropic::Models::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequest]
            #
            # @see Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestDenyParams
            def deny(spend_limit_increase_request_id, params = {})
              parsed, options =
                Anthropic::Beta::Organization::SpendLimits::IncreaseRequestDenyParams.dump_request(params)
              @client.request(
                method: :post,
                path: [
                  "v1/organizations/spend_limit_increase_requests/%1$s/deny?beta=true",
                  spend_limit_increase_request_id
                ],
                body: parsed,
                model: Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequest,
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
