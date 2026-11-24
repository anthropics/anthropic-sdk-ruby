# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class CaseListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::CaseListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # Return only cases whose `created_at` is after this time.
            sig { returns(T.nilable(Time)) }
            attr_reader :created_at_gt

            sig { params(created_at_gt: Time).void }
            attr_writer :created_at_gt

            # Return only cases whose `created_at` is at or after this time.
            sig { returns(T.nilable(Time)) }
            attr_reader :created_at_gte

            sig { params(created_at_gte: Time).void }
            attr_writer :created_at_gte

            # Return only cases whose `created_at` is before this time.
            sig { returns(T.nilable(Time)) }
            attr_reader :created_at_lt

            sig { params(created_at_lt: Time).void }
            attr_writer :created_at_lt

            # Return only cases whose `created_at` is at or before this time.
            sig { returns(T.nilable(Time)) }
            attr_reader :created_at_lte

            sig { params(created_at_lte: Time).void }
            attr_writer :created_at_lte

            # Number of cases to return per page, between 1 and 100. Defaults to 20.
            sig { returns(T.nilable(Integer)) }
            attr_reader :limit

            sig { params(limit: Integer).void }
            attr_writer :limit

            # Sort direction, by `order_by` and then by `id`. Defaults to `desc`.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Compliance::BetaComplianceReviewOrder::OrSymbol
                )
              )
            end
            attr_reader :order

            sig do
              params(
                order:
                  Anthropic::Beta::Compliance::BetaComplianceReviewOrder::OrSymbol
              ).void
            end
            attr_writer :order

            # The field to sort by. Defaults to `created_at`.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOrderBy::OrSymbol
                )
              )
            end
            attr_reader :order_by

            sig do
              params(
                order_by:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOrderBy::OrSymbol
              ).void
            end
            attr_writer :order_by

            # Opaque cursor from a previous response's `next_page`. Leave it out to get the
            # first page. A cursor works only with the filters and sort order of the request
            # that returned it.
            sig { returns(T.nilable(String)) }
            attr_reader :page

            sig { params(page: String).void }
            attr_writer :page

            # Return only cases with this status. Leave it out to get both open and closed
            # cases.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatusFilter::OrSymbol
                )
              )
            end
            attr_reader :status

            sig do
              params(
                status:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatusFilter::OrSymbol
              ).void
            end
            attr_writer :status

            # Return only cases whose `updated_at` is after this time.
            sig { returns(T.nilable(Time)) }
            attr_reader :updated_at_gt

            sig { params(updated_at_gt: Time).void }
            attr_writer :updated_at_gt

            # Return cases whose `updated_at` is at or after this time. Cases slightly older
            # than this time are also returned, so that a sync misses no change.
            sig { returns(T.nilable(Time)) }
            attr_reader :updated_at_gte

            sig { params(updated_at_gte: Time).void }
            attr_writer :updated_at_gte

            # Return only cases whose `updated_at` is before this time.
            sig { returns(T.nilable(Time)) }
            attr_reader :updated_at_lt

            sig { params(updated_at_lt: Time).void }
            attr_writer :updated_at_lt

            # Return only cases whose `updated_at` is at or before this time.
            sig { returns(T.nilable(Time)) }
            attr_reader :updated_at_lte

            sig { params(updated_at_lte: Time).void }
            attr_writer :updated_at_lte

            # Return only cases where a message's `user_profile_id` is this ID, including
            # cases that also have messages of other user profiles. A case stops matching once
            # its messages' `user_profile_id` is null. An ID that matches no reachable case
            # returns no cases. A request that sends the `anthropic-user-profile-id` header
            # without this parameter returns a 400 error.
            sig { returns(T.nilable(String)) }
            attr_reader :user_profile_id

            sig { params(user_profile_id: String).void }
            attr_writer :user_profile_id

            # Optional header to specify the beta version(s) you want to use.
            sig do
              returns(
                T.nilable(
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
                )
              )
            end
            attr_reader :betas

            sig do
              params(
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              ).void
            end
            attr_writer :betas

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
              ).returns(T.attached_class)
            end
            def self.new(
              # Return only cases whose `created_at` is after this time.
              created_at_gt: nil,
              # Return only cases whose `created_at` is at or after this time.
              created_at_gte: nil,
              # Return only cases whose `created_at` is before this time.
              created_at_lt: nil,
              # Return only cases whose `created_at` is at or before this time.
              created_at_lte: nil,
              # Number of cases to return per page, between 1 and 100. Defaults to 20.
              limit: nil,
              # Sort direction, by `order_by` and then by `id`. Defaults to `desc`.
              order: nil,
              # The field to sort by. Defaults to `created_at`.
              order_by: nil,
              # Opaque cursor from a previous response's `next_page`. Leave it out to get the
              # first page. A cursor works only with the filters and sort order of the request
              # that returned it.
              page: nil,
              # Return only cases with this status. Leave it out to get both open and closed
              # cases.
              status: nil,
              # Return only cases whose `updated_at` is after this time.
              updated_at_gt: nil,
              # Return cases whose `updated_at` is at or after this time. Cases slightly older
              # than this time are also returned, so that a sync misses no change.
              updated_at_gte: nil,
              # Return only cases whose `updated_at` is before this time.
              updated_at_lt: nil,
              # Return only cases whose `updated_at` is at or before this time.
              updated_at_lte: nil,
              # Return only cases where a message's `user_profile_id` is this ID, including
              # cases that also have messages of other user profiles. A case stops matching once
              # its messages' `user_profile_id` is null. An ID that matches no reachable case
              # returns no cases. A request that sends the `anthropic-user-profile-id` header
              # without this parameter returns a 400 error.
              user_profile_id: nil,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
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
