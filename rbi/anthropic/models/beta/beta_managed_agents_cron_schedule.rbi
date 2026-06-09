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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsCronSchedule::Type::OrSymbol
          )
        end
        attr_accessor :type

        # A timestamp in RFC 3339 format
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
            type:
              Anthropic::Beta::BetaManagedAgentsCronSchedule::Type::OrSymbol,
            last_run_at: T.nilable(Time),
            upcoming_runs_at: T::Array[Time]
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
          type:,
          # A timestamp in RFC 3339 format
          last_run_at: nil,
          # Up to 5 timestamps of upcoming cron occurrences. Non-empty for active and paused
          # deployments (reflects what the schedule would do if unpaused); empty once the
          # deployment is archived (`archived_at` set). Each fire is offset by a small
          # per-schedule jitter, so a run will actually start at or shortly after its listed
          # time.
          upcoming_runs_at: nil
        )
        end

        sig do
          override.returns(
            {
              expression: String,
              timezone: String,
              type:
                Anthropic::Beta::BetaManagedAgentsCronSchedule::Type::OrSymbol,
              last_run_at: T.nilable(Time),
              upcoming_runs_at: T::Array[Time]
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsCronSchedule::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CRON =
            T.let(
              :cron,
              Anthropic::Beta::BetaManagedAgentsCronSchedule::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsCronSchedule::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
