# typed: strong

module Anthropic
  module Models
    # The organization has no active External Key with this ID. The message names the
    # field.
    class BetaExternalKeyNotFoundError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::BetaExternalKeyNotFoundErrorDetails) }
      def details
      end
    end
  end
end
