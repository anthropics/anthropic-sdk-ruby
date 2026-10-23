# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          class BetaAnalyticsUsageItem < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageItem,
                  Anthropic::Internal::AnyHash
                )
              end

            # End of the period this row covers (exclusive), as an RFC 3339 UTC timestamp: the
            # end of the row's time bucket when a time-bucket width is set; otherwise the
            # requested `ending_at` (or, when omitted, the earlier of now and `starting_at`
            # plus 31 days) rounded down to the hour, because without a time bucket the report
            # covers whole hours.
            sig { returns(Time) }
            attr_accessor :ending_at

            # The dimension values this row's usage is broken out by.
            sig do
              returns(
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageGroup
              )
            end
            attr_reader :group

            sig do
              params(
                group:
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageGroup::OrHash
              ).void
            end
            attr_writer :group

            # Start of the period this row covers (inclusive), as an RFC 3339 UTC timestamp:
            # the start of the row's time bucket when a time-bucket width is set, otherwise
            # the requested `starting_at` rounded down to the hour.
            sig { returns(Time) }
            attr_accessor :starting_at

            # Token usage for this row.
            sig do
              returns(
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageMetrics
              )
            end
            attr_reader :usage

            sig do
              params(
                usage:
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageMetrics::OrHash
              ).void
            end
            attr_writer :usage

            sig do
              params(
                ending_at: Time,
                group:
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageGroup::OrHash,
                starting_at: Time,
                usage:
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageMetrics::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # End of the period this row covers (exclusive), as an RFC 3339 UTC timestamp: the
              # end of the row's time bucket when a time-bucket width is set; otherwise the
              # requested `ending_at` (or, when omitted, the earlier of now and `starting_at`
              # plus 31 days) rounded down to the hour, because without a time bucket the report
              # covers whole hours.
              ending_at:,
              # The dimension values this row's usage is broken out by.
              group:,
              # Start of the period this row covers (inclusive), as an RFC 3339 UTC timestamp:
              # the start of the row's time bucket when a time-bucket width is set, otherwise
              # the requested `starting_at` rounded down to the hour.
              starting_at:,
              # Token usage for this row.
              usage:
            )
            end

            sig do
              override.returns(
                {
                  ending_at: Time,
                  group:
                    Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageGroup,
                  starting_at: Time,
                  usage:
                    Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageMetrics
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
end
