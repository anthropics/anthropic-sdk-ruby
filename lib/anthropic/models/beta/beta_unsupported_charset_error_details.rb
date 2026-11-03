# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaUnsupportedCharsetErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :unsupported_charset]
        required :error_code, const: :unsupported_charset

        # @!method initialize(error_code: :unsupported_charset)
        #   The request's `Content-Type` header names a charset other than UTF-8, ISO-8859-1
        #   or US-ASCII. Send the request with no charset, or with one of these.
        #
        #   @param error_code [Symbol, :unsupported_charset]
      end
    end

    BetaUnsupportedCharsetErrorDetails = Beta::BetaUnsupportedCharsetErrorDetails
  end
end
