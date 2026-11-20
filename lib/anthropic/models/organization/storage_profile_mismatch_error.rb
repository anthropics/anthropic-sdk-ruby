# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The Workspace's storage and its user profile don't match: the Workspace and its
      # storage must have the same user profile, or both have none.
      class StorageProfileMismatchError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :storage_profile_mismatch]

        # @return [Anthropic::Models::Organization::StorageProfileMismatchErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::StorageProfileMismatchErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
