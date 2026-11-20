# typed: strong

module Anthropic
  module Models
    module Organization
      class StorageAttachedDuringArchiveErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::StorageAttachedDuringArchiveErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The Workspace was archived, but External Storage was attached to it during the
        # archive and is still attached. To detach it, archive the Workspace again as a
        # caller with the `org:external-storage:use` permission.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :storage_attached_during_archive)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
