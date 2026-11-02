# typed: strong

module Anthropic
  module Models
    module Organization
      class AnalyticsOfficeMetrics < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AnalyticsOfficeMetrics,
              Anthropic::Internal::AnyHash
            )
          end

        # Office Agent activity metrics for a single user on a given day within one Office
        # product.
        sig { returns(Anthropic::Organization::AnalyticsOfficeProductMetrics) }
        attr_reader :excel

        sig do
          params(
            excel:
              Anthropic::Organization::AnalyticsOfficeProductMetrics::OrHash
          ).void
        end
        attr_writer :excel

        # Office Agent activity metrics for a single user on a given day within one Office
        # product.
        sig { returns(Anthropic::Organization::AnalyticsOfficeProductMetrics) }
        attr_reader :outlook

        sig do
          params(
            outlook:
              Anthropic::Organization::AnalyticsOfficeProductMetrics::OrHash
          ).void
        end
        attr_writer :outlook

        # Office Agent activity metrics for a single user on a given day within one Office
        # product.
        sig { returns(Anthropic::Organization::AnalyticsOfficeProductMetrics) }
        attr_reader :powerpoint

        sig do
          params(
            powerpoint:
              Anthropic::Organization::AnalyticsOfficeProductMetrics::OrHash
          ).void
        end
        attr_writer :powerpoint

        # Office Agent activity metrics for a single user on a given day within one Office
        # product.
        sig { returns(Anthropic::Organization::AnalyticsOfficeProductMetrics) }
        attr_reader :word

        sig do
          params(
            word: Anthropic::Organization::AnalyticsOfficeProductMetrics::OrHash
          ).void
        end
        attr_writer :word

        # Office Agent activity metrics for a single user on a given day, broken out by
        # Office product.
        sig do
          params(
            excel:
              Anthropic::Organization::AnalyticsOfficeProductMetrics::OrHash,
            outlook:
              Anthropic::Organization::AnalyticsOfficeProductMetrics::OrHash,
            powerpoint:
              Anthropic::Organization::AnalyticsOfficeProductMetrics::OrHash,
            word: Anthropic::Organization::AnalyticsOfficeProductMetrics::OrHash
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
              excel: Anthropic::Organization::AnalyticsOfficeProductMetrics,
              outlook: Anthropic::Organization::AnalyticsOfficeProductMetrics,
              powerpoint:
                Anthropic::Organization::AnalyticsOfficeProductMetrics,
              word: Anthropic::Organization::AnalyticsOfficeProductMetrics
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
