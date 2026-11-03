# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class CannotInviteEmailsWithUnverifiedDomainsErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :cannot_invite_emails_with_unverified_domains]
        required :error_code, const: :cannot_invite_emails_with_unverified_domains

        # @!method initialize(error_code: :cannot_invite_emails_with_unverified_domains)
        #   The email address's domain is not one of the verified domains of the
        #   organization's parent organization.
        #
        #   @param error_code [Symbol, :cannot_invite_emails_with_unverified_domains]
      end
    end
  end
end
