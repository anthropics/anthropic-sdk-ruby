# frozen_string_literal: true

module Anthropic
  module Models
    class RequestBodyTooLargeAfterDecodingErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :request_body_too_large_after_decoding]
      required :error_code, const: :request_body_too_large_after_decoding

      # @!method initialize(error_code: :request_body_too_large_after_decoding)
      #   The compressed request body exceeds the request size limit once decoded.
      #
      #   @param error_code [Symbol, :request_body_too_large_after_decoding]
    end
  end
end
