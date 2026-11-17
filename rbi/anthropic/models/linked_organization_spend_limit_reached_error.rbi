# typed: strong

module Anthropic
  module Models
    # The organization linked to the request's user profile has reached a spend limit
    # that it set, or lacks credit for the request. The response does not say which
    # applies.
    class LinkedOrganizationSpendLimitReachedError < Anthropic::Errors::PaymentRequiredError
      sig { returns(Symbol) }
      def error_code
      end

      sig do
        returns(Anthropic::LinkedOrganizationSpendLimitReachedErrorDetails)
      end
      def details
      end
    end
  end
end
