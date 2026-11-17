# typed: strong

module Anthropic
  module Models
    # Anthropic cannot currently bill the organization linked to the request's user
    # profile, for a reason that lies with that organization's own account. The
    # response does not say what the reason is.
    class LinkedOrganizationBillingUnavailableError < Anthropic::Errors::PaymentRequiredError
      sig { returns(Symbol) }
      def error_code
      end

      sig do
        returns(Anthropic::LinkedOrganizationBillingUnavailableErrorDetails)
      end
      def details
      end
    end
  end
end
