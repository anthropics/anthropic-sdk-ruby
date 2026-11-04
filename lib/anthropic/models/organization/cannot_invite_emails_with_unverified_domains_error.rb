# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The email address's domain is not one of the verified domains of the
      # organization's parent organization.
      class CannotInviteEmailsWithUnverifiedDomainsError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :cannot_invite_emails_with_unverified_domains]

        # @return [Anthropic::Models::Organization::CannotInviteEmailsWithUnverifiedDomainsErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::CannotInviteEmailsWithUnverifiedDomainsErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
