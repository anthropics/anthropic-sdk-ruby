# frozen_string_literal: true

module Anthropic
  module Models
    # The request's `Content-Encoding` is not supported.
    class RequestBodyEncodingUnsupportedError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :request_body_encoding_unsupported]

      # @return [Anthropic::Models::RequestBodyEncodingUnsupportedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::RequestBodyEncodingUnsupportedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
