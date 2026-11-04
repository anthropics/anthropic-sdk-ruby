# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class InviteAlreadyExistsErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :invite_already_exists]
        required :error_code, const: :invite_already_exists

        # @!method initialize(error_code: :invite_already_exists)
        #   A pending invite already exists for the email address. The message names the
        #   invite.
        #
        #   @param error_code [Symbol, :invite_already_exists]
      end
    end
  end
end
