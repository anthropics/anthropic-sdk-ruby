# typed: strong

module Anthropic
  module Models
    # The compressed request body exceeds the request size limit once decoded.
    class RequestBodyTooLargeAfterDecodingError < Anthropic::Errors::ContentTooLargeError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::RequestBodyTooLargeAfterDecodingErrorDetails) }
      def details
      end
    end
  end
end
