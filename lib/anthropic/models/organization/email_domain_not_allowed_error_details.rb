# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class EmailDomainNotAllowedErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :email_domain_not_allowed]
        required :error_code, const: :email_domain_not_allowed

        # @!method initialize(error_code: :email_domain_not_allowed)
        #   The organization restricts invites to an allowed list of email domains, and the
        #   list is empty or does not include the email address's domain.
        #
        #   @param error_code [Symbol, :email_domain_not_allowed]
      end
    end
  end
end
