# frozen_string_literal: true

module Anthropic
  module Models
    # No usable Thread state was found for `previous_message_id`. Replay the full
    # conversation with `thread: {"type": "create"}` to start a new Thread.
    class ThreadNotFoundError < Anthropic::Errors::NotFoundError
      # @!method error_code
      #   @return [Symbol, :thread_not_found]

      # @return [Anthropic::Models::ThreadNotFoundErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ThreadNotFoundErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
