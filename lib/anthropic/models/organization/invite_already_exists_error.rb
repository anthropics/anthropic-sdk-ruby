# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # A pending invite already exists for the email address. The message names the
      # invite.
      class InviteAlreadyExistsError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :invite_already_exists]

        # @return [Anthropic::Models::Organization::InviteAlreadyExistsErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::InviteAlreadyExistsErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
