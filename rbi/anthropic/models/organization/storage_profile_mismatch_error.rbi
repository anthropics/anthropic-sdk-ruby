# typed: strong

module Anthropic
  module Models
    module Organization
      # The Workspace's storage and its user profile don't match: the Workspace and its
      # storage must have the same user profile, or both have none.
      class StorageProfileMismatchError < Anthropic::Errors::BadRequestError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(Anthropic::Organization::StorageProfileMismatchErrorDetails)
        end
        def details
        end
      end
    end
  end
end
