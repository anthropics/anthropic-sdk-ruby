# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsCostReportTimeBucket < Anthropic::Internal::Type::BaseModel
          # @!attribute ending_at
          #   End of the time bucket (exclusive) in RFC 3339 format.
          #
          #   @return [Time]
          required :ending_at, Time

          # @!attribute results
          #   Rows for this time bucket. Empty when the bucket has no data; otherwise a single
          #   combined row when `group_by[]` is omitted, or one row per group (subject to the
          #   per-bucket group cap described on the `group_by[]` parameter).
          #
          #   @return [Array<Anthropic::Models::Beta::Organization::BetaAnalyticsCostBucketedResult>]
          required :results,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult] }

          # @!attribute starting_at
          #   Start of the time bucket (inclusive) in RFC 3339 format.
          #
          #   @return [Time]
          required :starting_at, Time

          # @!method initialize(ending_at:, results:, starting_at:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsCostReportTimeBucket} for
          #   more details.
          #
          #   @param ending_at [Time] End of the time bucket (exclusive) in RFC 3339 format.
          #
          #   @param results [Array<Anthropic::Models::Beta::Organization::BetaAnalyticsCostBucketedResult>] Rows for this time bucket. Empty when the bucket has no data; otherwise a single
          #
          #   @param starting_at [Time] Start of the time bucket (inclusive) in RFC 3339 format.
        end
      end
    end
  end
end
