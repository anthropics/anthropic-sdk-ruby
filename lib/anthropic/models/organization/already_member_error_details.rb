# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AlreadyMemberErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :already_member]
        required :error_code, const: :already_member

        # @!method initialize(error_code: :already_member)
        #   The email address already belongs to a user in the organization. The message
        #   names the user.
        #
        #   @param error_code [Symbol, :already_member]
      end
    end
  end
end
