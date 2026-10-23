# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          class BetaAnalyticsCostMetrics < Anthropic::Internal::Type::BaseModel
            # @!attribute amount
            #   Amount (post-discount, pre-credit) in fractional cents (minor units).
            #
            #   @return [String]
            required :amount, String

            # @!attribute currency
            #   Currency code for the cost amount. Currently always `"USD"`.
            #
            #   @return [String]
            required :currency, String

            # @!attribute list_amount
            #   List-price amount (pre-discount) in fractional cents.
            #
            #   @return [String]
            required :list_amount, String

            # @!attribute requests
            #   Number of API requests in this row's scope. Null when `group_by` includes
            #   `cost_type` or `token_type` (the count has no per-component attribution; read it
            #   from the ungrouped response). For sandbox / code-execution events, this counts
            #   execution spans rather than HTTP requests (these rows surface with
            #   `product: null`).
            #
            #   @return [Integer, nil]
            required :requests, Integer, nil?: true

            # @!method initialize(amount:, currency:, list_amount:, requests:)
            #   The cost of one row.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsCostMetrics} for
            #   more details.
            #
            #   @param amount [String] Amount (post-discount, pre-credit) in fractional cents (minor units).
            #
            #   @param currency [String] Currency code for the cost amount. Currently always `"USD"`.
            #
            #   @param list_amount [String] List-price amount (pre-discount) in fractional cents.
            #
            #   @param requests [Integer, nil] Number of API requests in this row's scope. Null when `group_by` includes
            #   `cost\_
          end
        end
      end
    end
  end
end
