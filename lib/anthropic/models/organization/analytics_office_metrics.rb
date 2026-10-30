# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AnalyticsOfficeMetrics < Anthropic::Internal::Type::BaseModel
        # @!attribute excel
        #   Office Agent activity metrics for a single user on a given day within one Office
        #   product.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsOfficeProductMetrics]
        required :excel, -> { Anthropic::Organization::AnalyticsOfficeProductMetrics }

        # @!attribute outlook
        #   Office Agent activity metrics for a single user on a given day within one Office
        #   product.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsOfficeProductMetrics]
        required :outlook, -> { Anthropic::Organization::AnalyticsOfficeProductMetrics }

        # @!attribute powerpoint
        #   Office Agent activity metrics for a single user on a given day within one Office
        #   product.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsOfficeProductMetrics]
        required :powerpoint, -> { Anthropic::Organization::AnalyticsOfficeProductMetrics }

        # @!attribute word
        #   Office Agent activity metrics for a single user on a given day within one Office
        #   product.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsOfficeProductMetrics]
        required :word, -> { Anthropic::Organization::AnalyticsOfficeProductMetrics }

        # @!method initialize(excel:, outlook:, powerpoint:, word:)
        #   Office Agent activity metrics for a single user on a given day, broken out by
        #   Office product.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::AnalyticsOfficeMetrics} for more details.
        #
        #   @param excel [Anthropic::Models::Organization::AnalyticsOfficeProductMetrics] Office Agent activity metrics for a single user on a given day within one Office
        #
        #   @param outlook [Anthropic::Models::Organization::AnalyticsOfficeProductMetrics] Office Agent activity metrics for a single user on a given day within one Office
        #
        #   @param powerpoint [Anthropic::Models::Organization::AnalyticsOfficeProductMetrics] Office Agent activity metrics for a single user on a given day within one Office
        #
        #   @param word [Anthropic::Models::Organization::AnalyticsOfficeProductMetrics] Office Agent activity metrics for a single user on a given day within one Office
      end
    end
  end
end
