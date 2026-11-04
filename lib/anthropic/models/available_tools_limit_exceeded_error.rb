# frozen_string_literal: true

module Anthropic
  module Models
    # The tools available after a message exceed a limit on their number or their
    # size.
    class AvailableToolsLimitExceededError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :available_tools_limit_exceeded]

      # @return [Anthropic::Models::AvailableToolsLimitExceededErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::AvailableToolsLimitExceededErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
