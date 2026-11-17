# frozen_string_literal: true

module Anthropic
  module Models
    # Anthropic cannot currently bill the organization linked to the request's user
    # profile, for a reason that lies with that organization's own account. The
    # response does not say what the reason is.
    class LinkedOrganizationBillingUnavailableError < Anthropic::Errors::PaymentRequiredError
      # @!method error_code
      #   @return [Symbol, :linked_organization_billing_unavailable]

      # @return [Anthropic::Models::LinkedOrganizationBillingUnavailableErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::LinkedOrganizationBillingUnavailableErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
