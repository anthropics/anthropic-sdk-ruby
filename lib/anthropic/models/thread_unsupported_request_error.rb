# frozen_string_literal: true

module Anthropic
  module Models
    # The request combines `thread` with a request field or an organization setting
    # that Threads do not support; `unsupported`, when present, names it. Send the
    # full conversation without `thread`, or change that field.
    class ThreadUnsupportedRequestError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :thread_unsupported_request]

      # @return [Anthropic::Models::ThreadUnsupportedRequestErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ThreadUnsupportedRequestErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
