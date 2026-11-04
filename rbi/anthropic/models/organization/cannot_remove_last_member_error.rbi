# typed: strong

module Anthropic
  module Models
    module Organization
      # The user is the organization's only member. Add another member before removing
      # this one.
      class CannotRemoveLastMemberError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(Anthropic::Organization::CannotRemoveLastMemberErrorDetails)
        end
        def details
        end
      end
    end
  end
end
