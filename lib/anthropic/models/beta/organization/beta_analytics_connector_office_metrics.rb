# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorOfficeMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute excel
          #   Office Agent activity metrics for a single connector on a given day within one
          #   Office product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics]
          required :excel, -> { Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics }

          # @!attribute outlook
          #   Office Agent activity metrics for a single connector on a given day within one
          #   Office product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics]
          required :outlook, -> { Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics }

          # @!attribute powerpoint
          #   Office Agent activity metrics for a single connector on a given day within one
          #   Office product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics]
          required :powerpoint, -> { Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics }

          # @!attribute word
          #   Office Agent activity metrics for a single connector on a given day within one
          #   Office product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics]
          required :word, -> { Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics }

          # @!method initialize(excel:, outlook:, powerpoint:, word:)
          #   Office Agent activity metrics for a single connector on a given day, broken out
          #   by Office product.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorOfficeMetrics} for
          #   more details.
          #
          #   @param excel [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics] Office Agent activity metrics for a single connector on a given day within one O
          #
          #   @param outlook [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics] Office Agent activity metrics for a single connector on a given day within one O
          #
          #   @param powerpoint [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics] Office Agent activity metrics for a single connector on a given day within one O
          #
          #   @param word [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics] Office Agent activity metrics for a single connector on a given day within one O
        end
      end
    end
  end
end
