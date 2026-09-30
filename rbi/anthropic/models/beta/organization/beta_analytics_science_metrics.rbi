# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsScienceMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsScienceMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of delegations (handoffs to a specialized agent) in Claude Science
          # sessions
          sig { returns(Integer) }
          attr_accessor :delegation_count

          # Number of distinct Claude Science sessions. Approximate (HLL, typical error <2%)
          # in date-range mode. Null on aggregated rows where a distinct count cannot be
          # computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_session_count

          # Number of messages sent in Claude Science sessions
          sig { returns(Integer) }
          attr_accessor :message_count

          # Number of remote compute jobs launched from Claude Science sessions
          sig { returns(Integer) }
          attr_accessor :remote_compute_job_count

          # Total number of skill invocations in Claude Science sessions
          sig { returns(Integer) }
          attr_accessor :skills_used_count

          # Claude Science activity metrics for a single user on a given day.
          sig do
            params(
              delegation_count: Integer,
              distinct_session_count: T.nilable(Integer),
              message_count: Integer,
              remote_compute_job_count: Integer,
              skills_used_count: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of delegations (handoffs to a specialized agent) in Claude Science
            # sessions
            delegation_count:,
            # Number of distinct Claude Science sessions. Approximate (HLL, typical error <2%)
            # in date-range mode. Null on aggregated rows where a distinct count cannot be
            # computed.
            distinct_session_count:,
            # Number of messages sent in Claude Science sessions
            message_count:,
            # Number of remote compute jobs launched from Claude Science sessions
            remote_compute_job_count:,
            # Total number of skill invocations in Claude Science sessions
            skills_used_count:
          )
          end

          sig do
            override.returns(
              {
                delegation_count: Integer,
                distinct_session_count: T.nilable(Integer),
                message_count: Integer,
                remote_compute_job_count: Integer,
                skills_used_count: Integer
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
