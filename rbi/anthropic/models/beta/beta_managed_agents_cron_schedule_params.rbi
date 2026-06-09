# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsCronScheduleParams =
      Beta::BetaManagedAgentsCronScheduleParams

    module Beta
      class BetaManagedAgentsCronScheduleParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsCronScheduleParams,
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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsCronScheduleParams::Type::OrSymbol
          )
        end
        attr_accessor :type

        # 5-field POSIX cron schedule. Literal wall-clock matching in the configured
        # timezone.
        sig do
          params(
            expression: String,
            timezone: String,
            type:
              Anthropic::Beta::BetaManagedAgentsCronScheduleParams::Type::OrSymbol
          ).returns(T.attached_class)
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
          type:
        )
        end

        sig do
          override.returns(
            {
              expression: String,
              timezone: String,
              type:
                Anthropic::Beta::BetaManagedAgentsCronScheduleParams::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsCronScheduleParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CRON =
            T.let(
              :cron,
              Anthropic::Beta::BetaManagedAgentsCronScheduleParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsCronScheduleParams::Type::TaggedSymbol
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
