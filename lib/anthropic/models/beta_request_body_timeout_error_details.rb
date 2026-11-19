# frozen_string_literal: true

module Anthropic
  module Models
    class BetaRequestBodyTimeoutErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :request_body_timeout]
      required :error_code, const: :request_body_timeout

      # @!method initialize(error_code: :request_body_timeout)
      #   The request body did not finish arriving in time, so nothing was done. Send a
      #   smaller body, or send it over a faster connection.
      #
      #   @param error_code [Symbol, :request_body_timeout]
    end
  end
end
