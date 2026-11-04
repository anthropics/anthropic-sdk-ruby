# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The email address already belongs to a user in the organization. The message
      # names the user.
      class AlreadyMemberError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :already_member]

        # @return [Anthropic::Models::Organization::AlreadyMemberErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::AlreadyMemberErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
