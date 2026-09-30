# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsSkillOfficeMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute excel
          #   Office Agent activity metrics for a single skill on a given day within one
          #   Office product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics]
          required :excel, -> { Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics }

          # @!attribute outlook
          #   Office Agent activity metrics for a single skill on a given day within one
          #   Office product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics]
          required :outlook, -> { Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics }

          # @!attribute powerpoint
          #   Office Agent activity metrics for a single skill on a given day within one
          #   Office product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics]
          required :powerpoint, -> { Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics }

          # @!attribute word
          #   Office Agent activity metrics for a single skill on a given day within one
          #   Office product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics]
          required :word, -> { Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics }

          # @!method initialize(excel:, outlook:, powerpoint:, word:)
          #   Office Agent activity metrics for a single skill on a given day, broken out by
          #   Office product.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsSkillOfficeMetrics} for
          #   more details.
          #
          #   @param excel [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics] Office Agent activity metrics for a single skill on a given day within one Offic
          #
          #   @param outlook [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics] Office Agent activity metrics for a single skill on a given day within one Offic
          #
          #   @param powerpoint [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics] Office Agent activity metrics for a single skill on a given day within one Offic
          #
          #   @param word [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics] Office Agent activity metrics for a single skill on a given day within one Offic
        end
      end
    end
  end
end
