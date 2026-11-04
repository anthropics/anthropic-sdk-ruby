# typed: strong

module Anthropic
  module Models
    # The response that `previous_message_id` names has already been continued, and
    # each response can be continued only once. Continue from the Thread's most recent
    # response `id`.
    class ThreadAlreadyContinuedError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ThreadAlreadyContinuedErrorDetails) }
      def details
      end
    end
  end
end
