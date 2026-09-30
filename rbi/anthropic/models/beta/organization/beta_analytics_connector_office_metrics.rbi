# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorOfficeMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Office Agent activity metrics for a single connector on a given day within one
          # Office product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics
            )
          end
          attr_reader :excel

          sig do
            params(
              excel:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics::OrHash
            ).void
          end
          attr_writer :excel

          # Office Agent activity metrics for a single connector on a given day within one
          # Office product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics
            )
          end
          attr_reader :outlook

          sig do
            params(
              outlook:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics::OrHash
            ).void
          end
          attr_writer :outlook

          # Office Agent activity metrics for a single connector on a given day within one
          # Office product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics
            )
          end
          attr_reader :powerpoint

          sig do
            params(
              powerpoint:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics::OrHash
            ).void
          end
          attr_writer :powerpoint

          # Office Agent activity metrics for a single connector on a given day within one
          # Office product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics
            )
          end
          attr_reader :word

          sig do
            params(
              word:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics::OrHash
            ).void
          end
          attr_writer :word

          # Office Agent activity metrics for a single connector on a given day, broken out
          # by Office product.
          sig do
            params(
              excel:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics::OrHash,
              outlook:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics::OrHash,
              powerpoint:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics::OrHash,
              word:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Office Agent activity metrics for a single connector on a given day within one
            # Office product.
            excel:,
            # Office Agent activity metrics for a single connector on a given day within one
            # Office product.
            outlook:,
            # Office Agent activity metrics for a single connector on a given day within one
            # Office product.
            powerpoint:,
            # Office Agent activity metrics for a single connector on a given day within one
            # Office product.
            word:
          )
          end

          sig do
            override.returns(
              {
                excel:
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics,
                outlook:
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics,
                powerpoint:
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics,
                word:
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeProductMetrics
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
