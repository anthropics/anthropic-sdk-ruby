# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The External Key is bound to a user profile, and the Workspace does not have
      # that user profile. A Workspace can use only a key bound to its own user profile
      # or a key that isn't bound to one.
      class KeyProfileMismatchError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :key_profile_mismatch]

        # @return [Anthropic::Models::Organization::KeyProfileMismatchErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::KeyProfileMismatchErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
