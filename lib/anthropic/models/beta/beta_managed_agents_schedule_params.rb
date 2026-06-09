# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsScheduleParams < Anthropic::Internal::Type::BaseModel
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
        #   Required. IANA timezone identifier (e.g., "America/Los_Angeles", "UTC").
        #   Validated against the IANA timezone database.
        #
        #   @return [String]
        required :timezone, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsScheduleParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsScheduleParams::Type }

        # @!method initialize(expression:, timezone:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsScheduleParams} for more details.
        #
        #   5-field POSIX cron schedule. Literal wall-clock matching in the configured
        #   timezone.
        #
        #   @param expression [String] 5-field POSIX cron expression: minute hour day-of-month month day-of-week (e.g.,
        #
        #   @param timezone [String] Required. IANA timezone identifier (e.g., "America/Los_Angeles", "UTC"). Validat
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsScheduleParams::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsScheduleParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          CRON = :cron

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsScheduleParams = Beta::BetaManagedAgentsScheduleParams
  end
end
