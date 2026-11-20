# typed: strong

module Anthropic
  module Models
    module Organization
      # The Workspace was archived, but External Storage was attached to it during the
      # archive and is still attached. To detach it, archive the Workspace again as a
      # caller with the `org:external-storage:use` permission.
      class StorageAttachedDuringArchiveError < Anthropic::Errors::ConflictError
        sig { returns(Symbol) }
        def error_code
        end

        sig do
          returns(
            Anthropic::Organization::StorageAttachedDuringArchiveErrorDetails
          )
        end
        def details
        end
      end
    end
  end
end
