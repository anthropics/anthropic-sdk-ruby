# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # @see Anthropic::Resources::Beta::Compliance::Review::Notices#list
          class NoticeListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute case_id
            #   Return only notices whose `case_ids` include this case (`rvc_...`). A case that
            #   the API key can't read returns an empty list.
            #
            #   @return [String, nil]
            optional :case_id, String

            # @!attribute created_at_gt
            #   Return only notices whose `created_at` is after this time.
            #
            #   @return [Time, nil]
            optional :created_at_gt, Time

            # @!attribute created_at_gte
            #   Return notices whose `created_at` is at or after this time. Notices slightly
            #   older than this time are also returned, so that a poll misses no notice.
            #
            #   @return [Time, nil]
            optional :created_at_gte, Time

            # @!attribute created_at_lt
            #   Return only notices whose `created_at` is before this time.
            #
            #   @return [Time, nil]
            optional :created_at_lt, Time

            # @!attribute created_at_lte
            #   Return only notices whose `created_at` is at or before this time.
            #
            #   @return [Time, nil]
            optional :created_at_lte, Time

            # @!attribute limit
            #   Number of notices to return per page, between 1 and 100. Defaults to 20.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute order
            #   Sort direction, by `created_at` and then by `id`. Defaults to `desc`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Compliance::BetaComplianceReviewOrder, nil]
            optional :order, enum: -> { Anthropic::Beta::Compliance::BetaComplianceReviewOrder }

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page`. Leave it out to get the
            #   first page. A cursor works only with the filters and sort order of the request
            #   that returned it.
            #
            #   @return [String, nil]
            optional :page, String

            # @!attribute betas
            #   Optional header to specify the beta version(s) you want to use.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(case_id: nil, created_at_gt: nil, created_at_gte: nil, created_at_lt: nil, created_at_lte: nil, limit: nil, order: nil, page: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::NoticeListParams} for more
            #   details.
            #
            #   @param case_id [String] Return only notices whose `case_ids` include this case (`rvc_...`). A case that
            #
            #   @param created_at_gt [Time] Return only notices whose `created_at` is after this time.
            #
            #   @param created_at_gte [Time] Return notices whose `created_at` is at or after this time. Notices slightly old
            #
            #   @param created_at_lt [Time] Return only notices whose `created_at` is before this time.
            #
            #   @param created_at_lte [Time] Return only notices whose `created_at` is at or before this time.
            #
            #   @param limit [Integer] Number of notices to return per page, between 1 and 100. Defaults to 20.
            #
            #   @param order [Symbol, Anthropic::Models::Beta::Compliance::BetaComplianceReviewOrder] Sort direction, by `created_at` and then by `id`. Defaults to `desc`.
            #
            #   @param page [String] Opaque cursor from a previous response's `next_page`. Leave it out to get the fi
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
