# frozen_string_literal: true

module Anthropic
  module Models
    # The organization linked to the request's user profile has reached a spend limit
    # that it set, or lacks credit for the request. The response does not say which
    # applies.
    class LinkedOrganizationSpendLimitReachedError < Anthropic::Errors::PaymentRequiredError
      # @!method error_code
      #   @return [Symbol, :linked_organization_spend_limit_reached]

      # @return [Anthropic::Models::LinkedOrganizationSpendLimitReachedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::LinkedOrganizationSpendLimitReachedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
