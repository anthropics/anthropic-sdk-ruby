# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsOfficeMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute excel
          #   Office Agent activity metrics for a single user on a given day within one Office
          #   product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsOfficeProductMetrics]
          required :excel, -> { Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics }

          # @!attribute outlook
          #   Office Agent activity metrics for a single user on a given day within one Office
          #   product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsOfficeProductMetrics]
          required :outlook, -> { Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics }

          # @!attribute powerpoint
          #   Office Agent activity metrics for a single user on a given day within one Office
          #   product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsOfficeProductMetrics]
          required :powerpoint, -> { Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics }

          # @!attribute word
          #   Office Agent activity metrics for a single user on a given day within one Office
          #   product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsOfficeProductMetrics]
          required :word, -> { Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics }

          # @!method initialize(excel:, outlook:, powerpoint:, word:)
          #   Office Agent activity metrics for a single user on a given day, broken out by
          #   Office product.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsOfficeMetrics} for more
          #   details.
          #
          #   @param excel [Anthropic::Models::Beta::Organization::BetaAnalyticsOfficeProductMetrics] Office Agent activity metrics for a single user on a given day within one Office
          #
          #   @param outlook [Anthropic::Models::Beta::Organization::BetaAnalyticsOfficeProductMetrics] Office Agent activity metrics for a single user on a given day within one Office
          #
          #   @param powerpoint [Anthropic::Models::Beta::Organization::BetaAnalyticsOfficeProductMetrics] Office Agent activity metrics for a single user on a given day within one Office
          #
          #   @param word [Anthropic::Models::Beta::Organization::BetaAnalyticsOfficeProductMetrics] Office Agent activity metrics for a single user on a given day within one Office
        end
      end
    end
  end
end
