# typed: strong

module Anthropic
  module Models
    # A field that must stay the same across a Thread's turns differs from the value
    # stored with the Thread; the message names each such field. Send the stored
    # values, or replay the full conversation with `thread: {"type": "create"}` to
    # change them.
    class ThreadFingerprintMismatchError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ThreadFingerprintMismatchErrorDetails) }
      def details
      end
    end
  end
end
