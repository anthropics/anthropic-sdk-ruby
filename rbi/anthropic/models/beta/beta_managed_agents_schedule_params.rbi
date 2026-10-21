# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsScheduleParams = Beta::BetaManagedAgentsScheduleParams

    module Beta
      class BetaManagedAgentsScheduleParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsScheduleParams,
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

        # Required. IANA timezone identifier (e.g., "America/Los_Angeles", "UTC").
        # Validated against the IANA timezone database.
        sig { returns(String) }
        attr_accessor :timezone

        sig { returns(Symbol) }
        attr_accessor :type

        # A recurring schedule. Discriminated union — only cron is supported currently.
        sig do
          params(expression: String, timezone: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # 5-field POSIX cron expression: minute hour day-of-month month day-of-week (e.g.,
          # "0 9 \* \* 1-5" for weekdays at 9am). Day-of-week is 0-7 where 0 and 7 both mean
          # Sunday. Extended cron syntax - seconds or year fields, and the special
          # characters L, W, #, and ? - is not supported, nor are predefined shortcuts
          # (@daily).
          expression:,
          # Required. IANA timezone identifier (e.g., "America/Los_Angeles", "UTC").
          # Validated against the IANA timezone database.
          timezone:,
          type: :cron
        )
        end

        sig do
          override.returns(
            { expression: String, timezone: String, type: Symbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
