# typed: strong

module Anthropic
  module Models
    module Organization
      # The email address already belongs to a user in the organization. The message
      # names the user.
      class AlreadyMemberError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig { returns(Anthropic::Organization::AlreadyMemberErrorDetails) }
        def details
        end
      end
    end
  end
end
