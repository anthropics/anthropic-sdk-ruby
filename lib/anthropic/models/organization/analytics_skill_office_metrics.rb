# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AnalyticsSkillOfficeMetrics < Anthropic::Internal::Type::BaseModel
        # @!attribute excel
        #   Office Agent activity metrics for a single skill on a given day within one
        #   Office product.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsSkillOfficeProductMetrics]
        required :excel, -> { Anthropic::Organization::AnalyticsSkillOfficeProductMetrics }

        # @!attribute outlook
        #   Office Agent activity metrics for a single skill on a given day within one
        #   Office product.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsSkillOfficeProductMetrics]
        required :outlook, -> { Anthropic::Organization::AnalyticsSkillOfficeProductMetrics }

        # @!attribute powerpoint
        #   Office Agent activity metrics for a single skill on a given day within one
        #   Office product.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsSkillOfficeProductMetrics]
        required :powerpoint, -> { Anthropic::Organization::AnalyticsSkillOfficeProductMetrics }

        # @!attribute word
        #   Office Agent activity metrics for a single skill on a given day within one
        #   Office product.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsSkillOfficeProductMetrics]
        required :word, -> { Anthropic::Organization::AnalyticsSkillOfficeProductMetrics }

        # @!method initialize(excel:, outlook:, powerpoint:, word:)
        #   Office Agent activity metrics for a single skill on a given day, broken out by
        #   Office product.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::AnalyticsSkillOfficeMetrics} for more details.
        #
        #   @param excel [Anthropic::Models::Organization::AnalyticsSkillOfficeProductMetrics] Office Agent activity metrics for a single skill on a given day within one Offic
        #
        #   @param outlook [Anthropic::Models::Organization::AnalyticsSkillOfficeProductMetrics] Office Agent activity metrics for a single skill on a given day within one Offic
        #
        #   @param powerpoint [Anthropic::Models::Organization::AnalyticsSkillOfficeProductMetrics] Office Agent activity metrics for a single skill on a given day within one Offic
        #
        #   @param word [Anthropic::Models::Organization::AnalyticsSkillOfficeProductMetrics] Office Agent activity metrics for a single skill on a given day within one Offic
      end
    end
  end
end
