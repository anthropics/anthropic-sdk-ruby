# frozen_string_literal: true

module Anthropic
  module Models
    class RequestBodyEncodingUnsupportedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :request_body_encoding_unsupported]
      required :error_code, const: :request_body_encoding_unsupported

      # @!method initialize(error_code: :request_body_encoding_unsupported)
      #   The request's `Content-Encoding` is not supported.
      #
      #   @param error_code [Symbol, :request_body_encoding_unsupported]
    end
  end
end
