# frozen_string_literal: true

module Anthropic
  module Models
    # A field that must stay the same across a Thread's turns differs from the value
    # stored with the Thread; the message names each such field. Send the stored
    # values, or replay the full conversation with `thread: {"type": "create"}` to
    # change them.
    class ThreadFingerprintMismatchError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :thread_fingerprint_mismatch]

      # @return [Anthropic::Models::ThreadFingerprintMismatchErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ThreadFingerprintMismatchErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
