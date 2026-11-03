# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class CannotRemoveLastMemberErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :cannot_remove_last_member]
        required :error_code, const: :cannot_remove_last_member

        # @!method initialize(error_code: :cannot_remove_last_member)
        #   The user is the organization's only member. Add another member before removing
        #   this one.
        #
        #   @param error_code [Symbol, :cannot_remove_last_member]
      end
    end
  end
end
