# frozen_string_literal: true

module Anthropic
  module Models
    class RequestBodyEncodingInvalidErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :request_body_encoding_invalid]
      required :error_code, const: :request_body_encoding_invalid

      # @!method initialize(error_code: :request_body_encoding_invalid)
      #   The request body is not valid for its `Content-Encoding`.
      #
      #   @param error_code [Symbol, :request_body_encoding_invalid]
    end
  end
end
