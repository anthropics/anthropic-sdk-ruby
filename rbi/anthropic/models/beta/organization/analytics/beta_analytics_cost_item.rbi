# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          class BetaAnalyticsCostItem < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostItem,
                  Anthropic::Internal::AnyHash
                )
              end

            # Cost for this row.
            sig do
              returns(
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostMetrics
              )
            end
            attr_reader :cost

            sig do
              params(
                cost:
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostMetrics::OrHash
              ).void
            end
            attr_writer :cost

            # End of the period this row covers (exclusive), as an RFC 3339 UTC timestamp: the
            # end of the row's time bucket when a time-bucket width is set; otherwise the
            # requested `ending_at` (or, when omitted, the earlier of now and `starting_at`
            # plus 31 days) rounded down to the hour, because without a time bucket the report
            # covers whole hours.
            sig { returns(Time) }
            attr_accessor :ending_at

            # The dimension values this row's cost is broken out by.
            sig do
              returns(
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroup
              )
            end
            attr_reader :group

            sig do
              params(
                group:
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroup::OrHash
              ).void
            end
            attr_writer :group

            # Start of the period this row covers (inclusive), as an RFC 3339 UTC timestamp:
            # the start of the row's time bucket when a time-bucket width is set, otherwise
            # the requested `starting_at` rounded down to the hour.
            sig { returns(Time) }
            attr_accessor :starting_at

            sig do
              params(
                cost:
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostMetrics::OrHash,
                ending_at: Time,
                group:
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroup::OrHash,
                starting_at: Time
              ).returns(T.attached_class)
            end
            def self.new(
              # Cost for this row.
              cost:,
              # End of the period this row covers (exclusive), as an RFC 3339 UTC timestamp: the
              # end of the row's time bucket when a time-bucket width is set; otherwise the
              # requested `ending_at` (or, when omitted, the earlier of now and `starting_at`
              # plus 31 days) rounded down to the hour, because without a time bucket the report
              # covers whole hours.
              ending_at:,
              # The dimension values this row's cost is broken out by.
              group:,
              # Start of the period this row covers (inclusive), as an RFC 3339 UTC timestamp:
              # the start of the row's time bucket when a time-bucket width is set, otherwise
              # the requested `starting_at` rounded down to the hour.
              starting_at:
            )
            end

            sig do
              override.returns(
                {
                  cost:
                    Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostMetrics,
                  ending_at: Time,
                  group:
                    Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroup,
                  starting_at: Time
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
