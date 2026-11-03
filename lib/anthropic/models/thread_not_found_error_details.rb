# frozen_string_literal: true

module Anthropic
  module Models
    class ThreadNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :thread_not_found]
      required :error_code, const: :thread_not_found

      # @!method initialize(error_code: :thread_not_found)
      #   No usable Thread state was found for `previous_message_id`. Replay the full
      #   conversation with `thread: {"type": "create"}` to start a new Thread.
      #
      #   @param error_code [Symbol, :thread_not_found]
    end
  end
end
