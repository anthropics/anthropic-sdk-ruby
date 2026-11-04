# typed: strong

module Anthropic
  module Models
    # The request body is not valid for its `Content-Encoding`.
    class RequestBodyEncodingInvalidError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::RequestBodyEncodingInvalidErrorDetails) }
      def details
      end
    end
  end
end
