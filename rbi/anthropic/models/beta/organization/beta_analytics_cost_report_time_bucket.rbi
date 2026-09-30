# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsCostReportTimeBucket < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsCostReportTimeBucket,
                Anthropic::Internal::AnyHash
              )
            end

          # End of the time bucket (exclusive) in RFC 3339 format.
          sig { returns(Time) }
          attr_accessor :ending_at

          # Rows for this time bucket. Empty when the bucket has no data; otherwise a single
          # combined row when `group_by[]` is omitted, or one row per group (subject to the
          # per-bucket group cap described on the `group_by[]` parameter).
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult
              ]
            )
          end
          attr_accessor :results

          # Start of the time bucket (inclusive) in RFC 3339 format.
          sig { returns(Time) }
          attr_accessor :starting_at

          sig do
            params(
              ending_at: Time,
              results:
                T::Array[
                  Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::OrHash
                ],
              starting_at: Time
            ).returns(T.attached_class)
          end
          def self.new(
            # End of the time bucket (exclusive) in RFC 3339 format.
            ending_at:,
            # Rows for this time bucket. Empty when the bucket has no data; otherwise a single
            # combined row when `group_by[]` is omitted, or one row per group (subject to the
            # per-bucket group cap described on the `group_by[]` parameter).
            results:,
            # Start of the time bucket (inclusive) in RFC 3339 format.
            starting_at:
          )
          end

          sig do
            override.returns(
              {
                ending_at: Time,
                results:
                  T::Array[
                    Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult
                  ],
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
