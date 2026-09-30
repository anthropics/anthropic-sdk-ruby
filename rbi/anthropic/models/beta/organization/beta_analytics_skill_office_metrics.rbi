# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsSkillOfficeMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Office Agent activity metrics for a single skill on a given day within one
          # Office product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics
            )
          end
          attr_reader :excel

          sig do
            params(
              excel:
                Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics::OrHash
            ).void
          end
          attr_writer :excel

          # Office Agent activity metrics for a single skill on a given day within one
          # Office product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics
            )
          end
          attr_reader :outlook

          sig do
            params(
              outlook:
                Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics::OrHash
            ).void
          end
          attr_writer :outlook

          # Office Agent activity metrics for a single skill on a given day within one
          # Office product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics
            )
          end
          attr_reader :powerpoint

          sig do
            params(
              powerpoint:
                Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics::OrHash
            ).void
          end
          attr_writer :powerpoint

          # Office Agent activity metrics for a single skill on a given day within one
          # Office product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics
            )
          end
          attr_reader :word

          sig do
            params(
              word:
                Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics::OrHash
            ).void
          end
          attr_writer :word

          # Office Agent activity metrics for a single skill on a given day, broken out by
          # Office product.
          sig do
            params(
              excel:
                Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics::OrHash,
              outlook:
                Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics::OrHash,
              powerpoint:
                Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics::OrHash,
              word:
                Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics::OrHash
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
                  Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics,
                outlook:
                  Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics,
                powerpoint:
                  Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics,
                word:
                  Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeProductMetrics
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
