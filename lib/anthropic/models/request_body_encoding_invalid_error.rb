# frozen_string_literal: true

module Anthropic
  module Models
    # The request body is not valid for its `Content-Encoding`.
    class RequestBodyEncodingInvalidError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :request_body_encoding_invalid]

      # @return [Anthropic::Models::RequestBodyEncodingInvalidErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::RequestBodyEncodingInvalidErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
