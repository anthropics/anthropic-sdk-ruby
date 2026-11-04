# typed: strong

module Anthropic
  module Models
    module Organization
      # The email address's domain is not one of the verified domains of the
      # organization's parent organization.
      class CannotInviteEmailsWithUnverifiedDomainsError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(
            Anthropic::Organization::CannotInviteEmailsWithUnverifiedDomainsErrorDetails
          )
        end
        def details
        end
      end
    end
  end
end
