# typed: strong

module Anthropic
  module Models
    module Organization
      class AnalyticsSkillOfficeMetrics < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AnalyticsSkillOfficeMetrics,
              Anthropic::Internal::AnyHash
            )
          end

        # Office Agent activity metrics for a single skill on a given day within one
        # Office product.
        sig do
          returns(Anthropic::Organization::AnalyticsSkillOfficeProductMetrics)
        end
        attr_reader :excel

        sig do
          params(
            excel:
              Anthropic::Organization::AnalyticsSkillOfficeProductMetrics::OrHash
          ).void
        end
        attr_writer :excel

        # Office Agent activity metrics for a single skill on a given day within one
        # Office product.
        sig do
          returns(Anthropic::Organization::AnalyticsSkillOfficeProductMetrics)
        end
        attr_reader :outlook

        sig do
          params(
            outlook:
              Anthropic::Organization::AnalyticsSkillOfficeProductMetrics::OrHash
          ).void
        end
        attr_writer :outlook

        # Office Agent activity metrics for a single skill on a given day within one
        # Office product.
        sig do
          returns(Anthropic::Organization::AnalyticsSkillOfficeProductMetrics)
        end
        attr_reader :powerpoint

        sig do
          params(
            powerpoint:
              Anthropic::Organization::AnalyticsSkillOfficeProductMetrics::OrHash
          ).void
        end
        attr_writer :powerpoint

        # Office Agent activity metrics for a single skill on a given day within one
        # Office product.
        sig do
          returns(Anthropic::Organization::AnalyticsSkillOfficeProductMetrics)
        end
        attr_reader :word

        sig do
          params(
            word:
              Anthropic::Organization::AnalyticsSkillOfficeProductMetrics::OrHash
          ).void
        end
        attr_writer :word

        # Office Agent activity metrics for a single skill on a given day, broken out by
        # Office product.
        sig do
          params(
            excel:
              Anthropic::Organization::AnalyticsSkillOfficeProductMetrics::OrHash,
            outlook:
              Anthropic::Organization::AnalyticsSkillOfficeProductMetrics::OrHash,
            powerpoint:
              Anthropic::Organization::AnalyticsSkillOfficeProductMetrics::OrHash,
            word:
              Anthropic::Organization::AnalyticsSkillOfficeProductMetrics::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Office Agent activity metrics for a single skill on a given day within one
          # Office product.
          excel:,
          # Office Agent activity metrics for a single skill on a given day within one
          # Office product.
          outlook:,
          # Office Agent activity metrics for a single skill on a given day within one
          # Office product.
          powerpoint:,
          # Office Agent activity metrics for a single skill on a given day within one
          # Office product.
          word:
        )
        end

        sig do
          override.returns(
            {
              excel:
                Anthropic::Organization::AnalyticsSkillOfficeProductMetrics,
              outlook:
                Anthropic::Organization::AnalyticsSkillOfficeProductMetrics,
              powerpoint:
                Anthropic::Organization::AnalyticsSkillOfficeProductMetrics,
              word: Anthropic::Organization::AnalyticsSkillOfficeProductMetrics
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
