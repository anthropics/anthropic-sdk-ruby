# typed: strong

module Anthropic
  module Models
    module Organization
      class AnalyticsConnectorOfficeMetrics < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AnalyticsConnectorOfficeMetrics,
              Anthropic::Internal::AnyHash
            )
          end

        # Office Agent activity metrics for a single connector on a given day within one
        # Office product.
        sig do
          returns(
            Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics
          )
        end
        attr_reader :excel

        sig do
          params(
            excel:
              Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics::OrHash
          ).void
        end
        attr_writer :excel

        # Office Agent activity metrics for a single connector on a given day within one
        # Office product.
        sig do
          returns(
            Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics
          )
        end
        attr_reader :outlook

        sig do
          params(
            outlook:
              Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics::OrHash
          ).void
        end
        attr_writer :outlook

        # Office Agent activity metrics for a single connector on a given day within one
        # Office product.
        sig do
          returns(
            Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics
          )
        end
        attr_reader :powerpoint

        sig do
          params(
            powerpoint:
              Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics::OrHash
          ).void
        end
        attr_writer :powerpoint

        # Office Agent activity metrics for a single connector on a given day within one
        # Office product.
        sig do
          returns(
            Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics
          )
        end
        attr_reader :word

        sig do
          params(
            word:
              Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics::OrHash
          ).void
        end
        attr_writer :word

        # Office Agent activity metrics for a single connector on a given day, broken out
        # by Office product.
        sig do
          params(
            excel:
              Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics::OrHash,
            outlook:
              Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics::OrHash,
            powerpoint:
              Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics::OrHash,
            word:
              Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics::OrHash
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
                Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics,
              outlook:
                Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics,
              powerpoint:
                Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics,
              word:
                Anthropic::Organization::AnalyticsConnectorOfficeProductMetrics
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
