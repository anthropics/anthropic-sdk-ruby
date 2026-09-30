# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsOfficeMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsOfficeMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Office Agent activity metrics for a single user on a given day within one Office
          # product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics
            )
          end
          attr_reader :excel

          sig do
            params(
              excel:
                Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics::OrHash
            ).void
          end
          attr_writer :excel

          # Office Agent activity metrics for a single user on a given day within one Office
          # product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics
            )
          end
          attr_reader :outlook

          sig do
            params(
              outlook:
                Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics::OrHash
            ).void
          end
          attr_writer :outlook

          # Office Agent activity metrics for a single user on a given day within one Office
          # product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics
            )
          end
          attr_reader :powerpoint

          sig do
            params(
              powerpoint:
                Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics::OrHash
            ).void
          end
          attr_writer :powerpoint

          # Office Agent activity metrics for a single user on a given day within one Office
          # product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics
            )
          end
          attr_reader :word

          sig do
            params(
              word:
                Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics::OrHash
            ).void
          end
          attr_writer :word

          # Office Agent activity metrics for a single user on a given day, broken out by
          # Office product.
          sig do
            params(
              excel:
                Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics::OrHash,
              outlook:
                Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics::OrHash,
              powerpoint:
                Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics::OrHash,
              word:
                Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Office Agent activity metrics for a single user on a given day within one Office
            # product.
            excel:,
            # Office Agent activity metrics for a single user on a given day within one Office
            # product.
            outlook:,
            # Office Agent activity metrics for a single user on a given day within one Office
            # product.
            powerpoint:,
            # Office Agent activity metrics for a single user on a given day within one Office
            # product.
            word:
          )
          end

          sig do
            override.returns(
              {
                excel:
                  Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics,
                outlook:
                  Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics,
                powerpoint:
                  Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics,
                word:
                  Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics
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
