# typed: strong

module Anthropic
  module Models
    module Organization
      class StorageProfileMismatchErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::StorageProfileMismatchErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The storage setting that doesn't match the Workspace's user profile.
        sig { returns(String) }
        attr_accessor :field

        # The Workspace's storage and its user profile don't match: the Workspace and its
        # storage must have the same user profile, or both have none.
        sig do
          params(field: String, error_code: Symbol).returns(T.attached_class)
        end
        def self.new(
          # The storage setting that doesn't match the Workspace's user profile.
          field:,
          error_code: :storage_profile_mismatch
        )
        end

        sig { override.returns({ error_code: Symbol, field: String }) }
        def to_hash
        end
      end
    end
  end
end
