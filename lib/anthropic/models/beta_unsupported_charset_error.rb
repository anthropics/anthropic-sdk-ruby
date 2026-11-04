# frozen_string_literal: true

module Anthropic
  module Models
    # The request's `Content-Type` header names a charset other than UTF-8, ISO-8859-1
    # or US-ASCII. Send the request with no charset, or with one of these.
    class BetaUnsupportedCharsetError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :unsupported_charset]

      # @return [Anthropic::Models::BetaUnsupportedCharsetErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::BetaUnsupportedCharsetErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
