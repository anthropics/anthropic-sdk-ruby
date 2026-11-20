# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class StorageProfileMismatchErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :storage_profile_mismatch]
        required :error_code, const: :storage_profile_mismatch

        # @!attribute field
        #   The storage setting that doesn't match the Workspace's user profile.
        #
        #   @return [String]
        required :field, String

        # @!method initialize(field:, error_code: :storage_profile_mismatch)
        #   The Workspace's storage and its user profile don't match: the Workspace and its
        #   storage must have the same user profile, or both have none.
        #
        #   @param field [String] The storage setting that doesn't match the Workspace's user profile.
        #
        #   @param error_code [Symbol, :storage_profile_mismatch]
      end
    end
  end
end
