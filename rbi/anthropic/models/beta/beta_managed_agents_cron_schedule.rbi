# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsCronSchedule = Beta::BetaManagedAgentsCronSchedule

    module Beta
      class BetaManagedAgentsCronSchedule < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsCronSchedule,
              Anthropic::Internal::AnyHash
            )
          end

        # 5-field POSIX cron expression: minute hour day-of-month month day-of-week (e.g.,
        # "0 9 \* \* 1-5" for weekdays at 9am). Day-of-week is 0-7 where 0 and 7 both mean
        # Sunday. Extended cron syntax - seconds or year fields, and the special
        # characters L, W, #, and ? - is not supported, nor are predefined shortcuts
        # (@daily).
        sig { returns(String) }
        attr_accessor :expression

        # IANA timezone identifier (e.g., "America/Los_Angeles", "UTC").
        sig { returns(String) }
        attr_accessor :timezone

        sig { returns(Symbol) }
        attr_accessor :type

        # Time the most recent scheduled run actually started. Null until one completes;
        # preserved after the deployment is archived. Manual runs do not update this.
        sig { returns(T.nilable(Time)) }
        attr_accessor :last_run_at

        # Up to 5 timestamps of upcoming cron occurrences. Non-empty for active and paused
        # deployments (reflects what the schedule would do if unpaused); empty once the
        # deployment is archived (`archived_at` set). Each fire is offset by a small
        # per-schedule jitter, so a run will actually start at or shortly after its listed
        # time.
        sig { returns(T.nilable(T::Array[Time])) }
        attr_reader :upcoming_runs_at

        sig { params(upcoming_runs_at: T::Array[Time]).void }
        attr_writer :upcoming_runs_at

        # 5-field POSIX cron schedule with computed runtime timestamps.
        sig do
          params(
            expression: String,
            timezone: String,
            last_run_at: T.nilable(Time),
            upcoming_runs_at: T::Array[Time],
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # 5-field POSIX cron expression: minute hour day-of-month month day-of-week (e.g.,
          # "0 9 \* \* 1-5" for weekdays at 9am). Day-of-week is 0-7 where 0 and 7 both mean
          # Sunday. Extended cron syntax - seconds or year fields, and the special
          # characters L, W, #, and ? - is not supported, nor are predefined shortcuts
          # (@daily).
          expression:,
          # IANA timezone identifier (e.g., "America/Los_Angeles", "UTC").
          timezone:,
          # Time the most recent scheduled run actually started. Null until one completes;
          # preserved after the deployment is archived. Manual runs do not update this.
          last_run_at: nil,
          # Up to 5 timestamps of upcoming cron occurrences. Non-empty for active and paused
          # deployments (reflects what the schedule would do if unpaused); empty once the
          # deployment is archived (`archived_at` set). Each fire is offset by a small
          # per-schedule jitter, so a run will actually start at or shortly after its listed
          # time.
          upcoming_runs_at: nil,
          type: :cron
        )
        end

        sig do
          override.returns(
            {
              expression: String,
              timezone: String,
              type: Symbol,
              last_run_at: T.nilable(Time),
              upcoming_runs_at: T::Array[Time]
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
