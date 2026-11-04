# frozen_string_literal: true

module Anthropic
  module Models
    # Another request is still continuing from the same `previous_message_id`. Wait
    # for it to complete and continue from its response `id`, or replay the full
    # conversation with `thread: {"type": "create"}`.
    class ThreadContinueInFlightError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :thread_continue_in_flight]

      # @return [Anthropic::Models::ThreadContinueInFlightErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ThreadContinueInFlightErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
