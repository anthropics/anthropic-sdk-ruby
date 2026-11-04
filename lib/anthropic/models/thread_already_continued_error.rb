# frozen_string_literal: true

module Anthropic
  module Models
    # The response that `previous_message_id` names has already been continued, and
    # each response can be continued only once. Continue from the Thread's most recent
    # response `id`.
    class ThreadAlreadyContinuedError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :thread_already_continued]

      # @return [Anthropic::Models::ThreadAlreadyContinuedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ThreadAlreadyContinuedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
