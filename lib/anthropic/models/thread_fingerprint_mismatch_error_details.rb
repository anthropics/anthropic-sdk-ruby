# frozen_string_literal: true

module Anthropic
  module Models
    class ThreadFingerprintMismatchErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :thread_fingerprint_mismatch]
      required :error_code, const: :thread_fingerprint_mismatch

      # @!method initialize(error_code: :thread_fingerprint_mismatch)
      #   A field that must stay the same across a Thread's turns differs from the value
      #   stored with the Thread; the message names each such field. Send the stored
      #   values, or replay the full conversation with `thread: {"type": "create"}` to
      #   change them.
      #
      #   @param error_code [Symbol, :thread_fingerprint_mismatch]
    end
  end
end
