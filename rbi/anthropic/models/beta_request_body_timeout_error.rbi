# typed: strong

module Anthropic
  module Models
    # The request body did not finish arriving in time, so nothing was done. Send a
    # smaller body, or send it over a faster connection.
    class BetaRequestBodyTimeoutError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::BetaRequestBodyTimeoutErrorDetails) }
      def details
      end
    end
  end
end
