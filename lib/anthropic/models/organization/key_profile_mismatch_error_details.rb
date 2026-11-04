# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class KeyProfileMismatchErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :key_profile_mismatch]
        required :error_code, const: :key_profile_mismatch

        # @!method initialize(error_code: :key_profile_mismatch)
        #   The External Key is bound to a user profile, and the Workspace does not have
        #   that user profile. A Workspace can use only a key bound to its own user profile
        #   or a key that isn't bound to one.
        #
        #   @param error_code [Symbol, :key_profile_mismatch]
      end
    end
  end
end
