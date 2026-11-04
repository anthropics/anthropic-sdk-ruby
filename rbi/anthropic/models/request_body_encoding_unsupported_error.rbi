# typed: strong

module Anthropic
  module Models
    # The request's `Content-Encoding` is not supported.
    class RequestBodyEncodingUnsupportedError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::RequestBodyEncodingUnsupportedErrorDetails) }
      def details
      end
    end
  end
end
