# frozen_string_literal: true

module Anthropic
  module Models
    # The compressed request body exceeds the request size limit once decoded.
    class RequestBodyTooLargeAfterDecodingError < Anthropic::Errors::ContentTooLargeError
      # @!method error_code
      #   @return [Symbol, :request_body_too_large_after_decoding]

      # @return [Anthropic::Models::RequestBodyTooLargeAfterDecodingErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::RequestBodyTooLargeAfterDecodingErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
