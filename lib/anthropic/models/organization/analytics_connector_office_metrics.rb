# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AnalyticsConnectorOfficeMetrics < Anthropic::Internal::Type::BaseModel
        # @!attribute excel
        #   Office Agent activity metrics for a single connector on a given day within one
        #   Office product.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsConnectorOfficeProductMetrics]
        required :excel, -> { Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics }

        # @!attribute outlook
        #   Office Agent activity metrics for a single connector on a given day within one
        #   Office product.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsConnectorOfficeProductMetrics]
        required :outlook, -> { Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics }

        # @!attribute powerpoint
        #   Office Agent activity metrics for a single connector on a given day within one
        #   Office product.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsConnectorOfficeProductMetrics]
        required :powerpoint, -> { Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics }

        # @!attribute word
        #   Office Agent activity metrics for a single connector on a given day within one
        #   Office product.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsConnectorOfficeProductMetrics]
        required :word, -> { Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics }

        # @!method initialize(excel:, outlook:, powerpoint:, word:)
        #   Office Agent activity metrics for a single connector on a given day, broken out
        #   by Office product.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::AnalyticsConnectorOfficeMetrics} for more
        #   details.
        #
        #   @param excel [Anthropic::Models::Organization::AnalyticsConnectorOfficeProductMetrics] Office Agent activity metrics for a single connector on a given day within one O
        #
        #   @param outlook [Anthropic::Models::Organization::AnalyticsConnectorOfficeProductMetrics] Office Agent activity metrics for a single connector on a given day within one O
        #
        #   @param powerpoint [Anthropic::Models::Organization::AnalyticsConnectorOfficeProductMetrics] Office Agent activity metrics for a single connector on a given day within one O
        #
        #   @param word [Anthropic::Models::Organization::AnalyticsConnectorOfficeProductMetrics] Office Agent activity metrics for a single connector on a given day within one O
      end
    end
  end
end
