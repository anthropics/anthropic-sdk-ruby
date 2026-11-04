# typed: strong

module Anthropic
  module Models
    # The request's `Content-Type` header names a charset other than UTF-8, ISO-8859-1
    # or US-ASCII. Send the request with no charset, or with one of these.
    class BetaUnsupportedCharsetError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::BetaUnsupportedCharsetErrorDetails) }
      def details
      end
    end
  end
end
