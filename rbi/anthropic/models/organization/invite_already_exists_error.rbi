# typed: strong

module Anthropic
  module Models
    module Organization
      # A pending invite already exists for the email address. The message names the
      # invite.
      class InviteAlreadyExistsError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(Anthropic::Organization::InviteAlreadyExistsErrorDetails)
        end
        def details
        end
      end
    end
  end
end
