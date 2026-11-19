# frozen_string_literal: true

module Anthropic
  module Models
    # The request body did not finish arriving in time, so nothing was done. Send a
    # smaller body, or send it over a faster connection.
    class BetaRequestBodyTimeoutError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :request_body_timeout]

      # @return [Anthropic::Models::BetaRequestBodyTimeoutErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::BetaRequestBodyTimeoutErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
