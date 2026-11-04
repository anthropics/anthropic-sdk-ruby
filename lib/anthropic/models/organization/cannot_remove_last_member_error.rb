# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The user is the organization's only member. Add another member before removing
      # this one.
      class CannotRemoveLastMemberError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :cannot_remove_last_member]

        # @return [Anthropic::Models::Organization::CannotRemoveLastMemberErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::CannotRemoveLastMemberErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
