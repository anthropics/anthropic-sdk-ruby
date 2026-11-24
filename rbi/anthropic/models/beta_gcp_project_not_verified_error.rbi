# typed: strong

module Anthropic
  module Models
    # The organization has not proved that it owns the Google Cloud project that holds
    # the key or bucket. The message names the field.
    class BetaGCPProjectNotVerifiedError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::BetaGCPProjectNotVerifiedErrorDetails) }
      def details
      end
    end
  end
end
