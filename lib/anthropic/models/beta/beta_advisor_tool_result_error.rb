# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaAdvisorToolResultError < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaAdvisorToolResultError::ErrorCode]
        required :error_code, enum: -> { Anthropic::Beta::BetaAdvisorToolResultError::ErrorCode }

        # @!attribute type
        #
        #   @return [Symbol, :advisor_tool_result_error]
        required :type, const: :advisor_tool_result_error

        # @!method initialize(error_code:, type: :advisor_tool_result_error)
        #   @param error_code [Symbol, Anthropic::Models::Beta::BetaAdvisorToolResultError::ErrorCode]
        #   @param type [Symbol, :advisor_tool_result_error]

        # @see Anthropic::Models::Beta::BetaAdvisorToolResultError#error_code
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

    BetaAdvisorToolResultError = Beta::BetaAdvisorToolResultError
  end
end
