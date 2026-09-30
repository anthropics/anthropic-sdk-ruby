# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsScienceMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute delegation_count
          #   Number of delegations (handoffs to a specialized agent) in Claude Science
          #   sessions
          #
          #   @return [Integer]
          required :delegation_count, Integer

          # @!attribute distinct_session_count
          #   Number of distinct Claude Science sessions. Approximate (HLL, typical error <2%)
          #   in date-range mode. Null on aggregated rows where a distinct count cannot be
          #   computed.
          #
          #   @return [Integer, nil]
          required :distinct_session_count, Integer, nil?: true

          # @!attribute message_count
          #   Number of messages sent in Claude Science sessions
          #
          #   @return [Integer]
          required :message_count, Integer

          # @!attribute remote_compute_job_count
          #   Number of remote compute jobs launched from Claude Science sessions
          #
          #   @return [Integer]
          required :remote_compute_job_count, Integer

          # @!attribute skills_used_count
          #   Total number of skill invocations in Claude Science sessions
          #
          #   @return [Integer]
          required :skills_used_count, Integer

          # @!method initialize(delegation_count:, distinct_session_count:, message_count:, remote_compute_job_count:, skills_used_count:)
          #   Claude Science activity metrics for a single user on a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsScienceMetrics} for more
          #   details.
          #
          #   @param delegation_count [Integer] Number of delegations (handoffs to a specialized agent) in Claude Science sessio
          #
          #   @param distinct_session_count [Integer, nil] Number of distinct Claude Science sessions. Approximate (HLL, typical error <2%)
          #
          #   @param message_count [Integer] Number of messages sent in Claude Science sessions
          #
          #   @param remote_compute_job_count [Integer] Number of remote compute jobs launched from Claude Science sessions
          #
          #   @param skills_used_count [Integer] Total number of skill invocations in Claude Science sessions
        end
      end
    end
  end
end
