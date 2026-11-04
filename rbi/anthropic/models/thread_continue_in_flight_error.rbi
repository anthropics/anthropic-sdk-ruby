# typed: strong

module Anthropic
  module Models
    # Another request is still continuing from the same `previous_message_id`. Wait
    # for it to complete and continue from its response `id`, or replay the full
    # conversation with `thread: {"type": "create"}`.
    class ThreadContinueInFlightError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ThreadContinueInFlightErrorDetails) }
      def details
      end
    end
  end
end
