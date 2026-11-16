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
        #   After this request, the External Key and the Workspace would not have the same
        #   user profile. A key and its Workspace must have the same user profile, or both
        #   have none.
        #
        #   @param error_code [Symbol, :key_profile_mismatch]
      end
    end
  end
end
