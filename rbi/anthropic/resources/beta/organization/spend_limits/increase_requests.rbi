# typed: strong

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
            sig do
              params(
                spend_limit_increase_request_id: String,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequest
              )
            end
            def retrieve(
              # ID of the spend limit increase request.
              spend_limit_increase_request_id,
              request_options: {}
            )
            end

            # List spend limit increase requests, most recent first.
            #
            # Pending requests include a live `spend_summary` for the requester. Requests
            # whose requester is no longer a member are excluded.
            sig do
              params(
                actor_ids: T.nilable(T::Array[String]),
                limit: Integer,
                page: T.nilable(String),
                status:
                  T.nilable(
                    T::Array[
                      Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus::OrSymbol
                    ]
                  ),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::PageCursor[
                  Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequest
                ]
              )
            end
            def list(
              # Filter by requester, as `user_...` tagged IDs.
              actor_ids: nil,
              limit: nil,
              # Opaque cursor from a previous response's `next_page`.
              page: nil,
              # Filter by status. Omit to return all.
              status: nil,
              request_options: {}
            )
            end

            # Approve a pending spend limit increase request.
            #
            # Writes a per-user spend limit at `amount` for the requester and transitions the
            # request to `approved`. `period` defaults to the period the member was blocked
            # on. Anthropic emails the requester unless `suppress_notification` is set.
            sig do
              params(
                spend_limit_increase_request_id: String,
                amount: String,
                period:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaSpendLimitPeriod::OrSymbol
                  ),
                suppress_notification: T::Boolean,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveResponse
              )
            end
            def approve(
              # ID of the spend limit increase request.
              spend_limit_increase_request_id,
              # New per-user spend limit as a non-negative integer decimal string (minor units).
              amount:,
              period: nil,
              suppress_notification: nil,
              request_options: {}
            )
            end

            # Deny a pending spend limit increase request.
            #
            # Idempotent on `denied`; denying an already-`approved` request returns 400.
            # Anthropic emails the requester unless `suppress_notification` is set.
            sig do
              params(
                spend_limit_increase_request_id: String,
                suppress_notification: T::Boolean,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequest
              )
            end
            def deny(
              # ID of the spend limit increase request.
              spend_limit_increase_request_id,
              suppress_notification: nil,
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
