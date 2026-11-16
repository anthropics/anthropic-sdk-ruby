# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # After this request, the External Key and the Workspace would not have the same
      # user profile. A key and its Workspace must have the same user profile, or both
      # have none.
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
