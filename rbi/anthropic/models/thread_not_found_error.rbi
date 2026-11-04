# typed: strong

module Anthropic
  module Models
    # No usable Thread state was found for `previous_message_id`. Replay the full
    # conversation with `thread: {"type": "create"}` to start a new Thread.
    class ThreadNotFoundError < Anthropic::Errors::NotFoundError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ThreadNotFoundErrorDetails) }
      def details
      end
    end
  end
end
