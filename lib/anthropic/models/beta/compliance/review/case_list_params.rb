# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # @see Anthropic::Resources::Beta::Compliance::Review::Cases#list
          class CaseListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute created_at_gt
            #   Return only cases whose `created_at` is after this time.
            #
            #   @return [Time, nil]
            optional :created_at_gt, Time

            # @!attribute created_at_gte
            #   Return only cases whose `created_at` is at or after this time.
            #
            #   @return [Time, nil]
            optional :created_at_gte, Time

            # @!attribute created_at_lt
            #   Return only cases whose `created_at` is before this time.
            #
            #   @return [Time, nil]
            optional :created_at_lt, Time

            # @!attribute created_at_lte
            #   Return only cases whose `created_at` is at or before this time.
            #
            #   @return [Time, nil]
            optional :created_at_lte, Time

            # @!attribute limit
            #   Number of cases to return per page, between 1 and 100. Defaults to 20.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute order
            #   Sort direction, by `order_by` and then by `id`. Defaults to `desc`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Compliance::BetaComplianceReviewOrder, nil]
            optional :order, enum: -> { Anthropic::Beta::Compliance::BetaComplianceReviewOrder }

            # @!attribute order_by
            #   The field to sort by. Defaults to `created_at`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseOrderBy, nil]
            optional :order_by, enum: -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseOrderBy }

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page`. Leave it out to get the
            #   first page. A cursor works only with the filters and sort order of the request
            #   that returned it.
            #
            #   @return [String, nil]
            optional :page, String

            # @!attribute status
            #   Return only cases with this status. Leave it out to get both open and closed
            #   cases.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseStatusFilter, nil]
            optional :status, enum: -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewCaseStatusFilter }

            # @!attribute updated_at_gt
            #   Return only cases whose `updated_at` is after this time.
            #
            #   @return [Time, nil]
            optional :updated_at_gt, Time

            # @!attribute updated_at_gte
            #   Return cases whose `updated_at` is at or after this time. Cases slightly older
            #   than this time are also returned, so that a sync misses no change.
            #
            #   @return [Time, nil]
            optional :updated_at_gte, Time

            # @!attribute updated_at_lt
            #   Return only cases whose `updated_at` is before this time.
            #
            #   @return [Time, nil]
            optional :updated_at_lt, Time

            # @!attribute updated_at_lte
            #   Return only cases whose `updated_at` is at or before this time.
            #
            #   @return [Time, nil]
            optional :updated_at_lte, Time

            # @!attribute user_profile_id
            #   Return only cases where a message's `user_profile_id` is this ID, including
            #   cases that also have messages of other user profiles. A case stops matching once
            #   its messages' `user_profile_id` is null. An ID that matches no reachable case
            #   returns no cases. A request that sends the `anthropic-user-profile-id` header
            #   without this parameter returns a 400 error.
            #
            #   @return [String, nil]
            optional :user_profile_id, String

            # @!attribute betas
            #   Optional header to specify the beta version(s) you want to use.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, limit: nil, order: nil, order_by: nil, page: nil, status: nil, updated_at_gt: nil, updated_at_gte: nil, updated_at_lt: nil, updated_at_lte: nil, user_profile_id: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::CaseListParams} for more details.
            #
            #   @param created_at_gt [Time] Return only cases whose `created_at` is after this time.
            #
            #   @param created_at_gte [Time] Return only cases whose `created_at` is at or after this time.
            #
            #   @param created_at_lt [Time] Return only cases whose `created_at` is before this time.
            #
            #   @param created_at_lte [Time] Return only cases whose `created_at` is at or before this time.
            #
            #   @param limit [Integer] Number of cases to return per page, between 1 and 100. Defaults to 20.
            #
            #   @param order [Symbol, Anthropic::Models::Beta::Compliance::BetaComplianceReviewOrder] Sort direction, by `order_by` and then by `id`. Defaults to `desc`.
            #
            #   @param order_by [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseOrderBy] The field to sort by. Defaults to `created_at`.
            #
            #   @param page [String] Opaque cursor from a previous response's `next_page`. Leave it out to get the fi
            #
            #   @param status [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewCaseStatusFilter] Return only cases with this status. Leave it out to get both open and closed cas
            #
            #   @param updated_at_gt [Time] Return only cases whose `updated_at` is after this time.
            #
            #   @param updated_at_gte [Time] Return cases whose `updated_at` is at or after this time. Cases slightly older t
            #
            #   @param updated_at_lt [Time] Return only cases whose `updated_at` is before this time.
            #
            #   @param updated_at_lte [Time] Return only cases whose `updated_at` is at or before this time.
            #
            #   @param user_profile_id [String] Return only cases where a message's `user_profile_id` is this ID, including case
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
