# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The Workspace was archived, but External Storage was attached to it during the
      # archive and is still attached. To detach it, archive the Workspace again as a
      # caller with the `org:external-storage:use` permission.
      class StorageAttachedDuringArchiveError < Anthropic::Errors::ConflictError
        # @!method error_code
        #   @return [Symbol, :storage_attached_during_archive]

        # @return [Anthropic::Models::Organization::StorageAttachedDuringArchiveErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::StorageAttachedDuringArchiveErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
