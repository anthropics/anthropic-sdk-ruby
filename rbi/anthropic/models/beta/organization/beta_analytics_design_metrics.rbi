# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsDesignMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsDesignMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of distinct Claude Design projects created. Exact in date-range mode: a
          # creation belongs to exactly one day, so the per-day counts never overlap and
          # their sum over the window is the exact count of distinct creations in it.
          sig { returns(Integer) }
          attr_accessor :distinct_projects_created_count

          # Number of distinct Claude Design projects the user worked in. Approximate (HLL,
          # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          # count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_projects_used_count

          # Number of distinct Claude Design sessions. Approximate (HLL, typical error <2%)
          # in date-range mode. Null on aggregated rows where a distinct count cannot be
          # computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_session_count

          # Number of messages sent in Claude Design sessions
          sig { returns(Integer) }
          attr_accessor :message_count

          # Claude Design activity metrics for a single user on a given day.
          sig do
            params(
              distinct_projects_created_count: Integer,
              distinct_projects_used_count: T.nilable(Integer),
              distinct_session_count: T.nilable(Integer),
              message_count: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of distinct Claude Design projects created. Exact in date-range mode: a
            # creation belongs to exactly one day, so the per-day counts never overlap and
            # their sum over the window is the exact count of distinct creations in it.
            distinct_projects_created_count:,
            # Number of distinct Claude Design projects the user worked in. Approximate (HLL,
            # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
            # count cannot be computed.
            distinct_projects_used_count:,
            # Number of distinct Claude Design sessions. Approximate (HLL, typical error <2%)
            # in date-range mode. Null on aggregated rows where a distinct count cannot be
            # computed.
            distinct_session_count:,
            # Number of messages sent in Claude Design sessions
            message_count:
          )
          end

          sig do
            override.returns(
              {
                distinct_projects_created_count: Integer,
                distinct_projects_used_count: T.nilable(Integer),
                distinct_session_count: T.nilable(Integer),
                message_count: Integer
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
