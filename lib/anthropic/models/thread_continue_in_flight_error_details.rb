# frozen_string_literal: true

module Anthropic
  module Models
    class ThreadContinueInFlightErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :thread_continue_in_flight]
      required :error_code, const: :thread_continue_in_flight

      # @!method initialize(error_code: :thread_continue_in_flight)
      #   Another request is still continuing from the same `previous_message_id`. Wait
      #   for it to complete and continue from its response `id`, or replay the full
      #   conversation with `thread: {"type": "create"}`.
      #
      #   @param error_code [Symbol, :thread_continue_in_flight]
    end
  end
end
