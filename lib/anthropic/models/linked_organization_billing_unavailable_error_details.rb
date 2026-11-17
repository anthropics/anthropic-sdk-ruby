# frozen_string_literal: true

module Anthropic
  module Models
    class LinkedOrganizationBillingUnavailableErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :linked_organization_billing_unavailable]
      required :error_code, const: :linked_organization_billing_unavailable

      # @!method initialize(error_code: :linked_organization_billing_unavailable)
      #   Anthropic cannot currently bill the organization linked to the request's user
      #   profile, for a reason that lies with that organization's own account. The
      #   response does not say what the reason is.
      #
      #   @param error_code [Symbol, :linked_organization_billing_unavailable]
    end
  end
end
