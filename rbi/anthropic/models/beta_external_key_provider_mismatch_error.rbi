# typed: strong

module Anthropic
  module Models
    # The External Key is held by a key management service that this endpoint does not
    # take. The message names the field and the service it takes.
    class BetaExternalKeyProviderMismatchError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::BetaExternalKeyProviderMismatchErrorDetails) }
      def details
      end
    end
  end
end
