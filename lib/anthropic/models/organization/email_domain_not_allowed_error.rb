# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The organization restricts invites to an allowed list of email domains, and the
      # list is empty or does not include the email address's domain.
      class EmailDomainNotAllowedError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :email_domain_not_allowed]

        # @return [Anthropic::Models::Organization::EmailDomainNotAllowedErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::EmailDomainNotAllowedErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
