# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaAdvisorToolResultErrorParam < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaAdvisorToolResultErrorParam::ErrorCode]
        required :error_code, enum: -> { Anthropic::Beta::BetaAdvisorToolResultErrorParam::ErrorCode }

        # @!attribute type
        #
        #   @return [Symbol, :advisor_tool_result_error]
        required :type, const: :advisor_tool_result_error

        # @!method initialize(error_code:, type: :advisor_tool_result_error)
        #   @param error_code [Symbol, Anthropic::Models::Beta::BetaAdvisorToolResultErrorParam::ErrorCode]
        #   @param type [Symbol, :advisor_tool_result_error]

        # @see Anthropic::Models::Beta::BetaAdvisorToolResultErrorParam#error_code
        module ErrorCode
          extend Anthropic::Internal::Type::Enum

          MAX_USES_EXCEEDED = :max_uses_exceeded
          PROMPT_TOO_LONG = :prompt_too_long
          TOO_MANY_REQUESTS = :too_many_requests
          OVERLOADED = :overloaded
          UNAVAILABLE = :unavailable
          EXECUTION_TIME_EXCEEDED = :execution_time_exceeded

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaAdvisorToolResultErrorParam = Beta::BetaAdvisorToolResultErrorParam
  end
end
