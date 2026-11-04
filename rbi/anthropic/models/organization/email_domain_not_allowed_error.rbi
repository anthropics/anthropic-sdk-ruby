# typed: strong

module Anthropic
  module Models
    module Organization
      # The organization restricts invites to an allowed list of email domains, and the
      # list is empty or does not include the email address's domain.
      class EmailDomainNotAllowedError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(Anthropic::Organization::EmailDomainNotAllowedErrorDetails)
        end
        def details
        end
      end
    end
  end
end
