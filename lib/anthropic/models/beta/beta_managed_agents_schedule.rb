# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSchedule < Anthropic::Internal::Type::BaseModel
        # @!attribute expression
        #   5-field POSIX cron expression: minute hour day-of-month month day-of-week (e.g.,
        #   "0 9 \* \* 1-5" for weekdays at 9am). Day-of-week is 0-7 where 0 and 7 both mean
        #   Sunday. Extended cron syntax - seconds or year fields, and the special
        #   characters L, W, #, and ? - is not supported, nor are predefined shortcuts
        #   (@daily).
        #
        #   @return [String]
        required :expression, String

        # @!attribute timezone
        #   IANA timezone identifier (e.g., "America/Los_Angeles", "UTC").
        #
        #   @return [String]
        required :timezone, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSchedule::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSchedule::Type }

        # @!attribute last_run_at
        #   A timestamp in RFC 3339 format
        #
        #   @return [Time, nil]
        optional :last_run_at, Time, nil?: true

        # @!attribute upcoming_runs_at
        #   Up to 5 timestamps of upcoming cron occurrences. Non-empty for active and paused
        #   deployments (reflects what the schedule would do if unpaused); empty once the
        #   deployment is archived (`archived_at` set). Each fire is offset by a small
        #   per-schedule jitter, so a run will actually start at or shortly after its listed
        #   time.
        #
        #   @return [Array<Time>, nil]
        optional :upcoming_runs_at, Anthropic::Internal::Type::ArrayOf[Time]

        # @!method initialize(expression:, timezone:, type:, last_run_at: nil, upcoming_runs_at: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsSchedule} for more details.
        #
        #   5-field POSIX cron schedule with computed runtime timestamps.
        #
        #   @param expression [String] 5-field POSIX cron expression: minute hour day-of-month month day-of-week (e.g.,
        #
        #   @param timezone [String] IANA timezone identifier (e.g., "America/Los_Angeles", "UTC").
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSchedule::Type]
        #
        #   @param last_run_at [Time, nil] A timestamp in RFC 3339 format
        #
        #   @param upcoming_runs_at [Array<Time>] Up to 5 timestamps of upcoming cron occurrences. Non-empty for active and paused

        # @see Anthropic::Models::Beta::BetaManagedAgentsSchedule#type
        module Type
          extend Anthropic::Internal::Type::Enum

          CRON = :cron

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSchedule = Beta::BetaManagedAgentsSchedule
  end
end
