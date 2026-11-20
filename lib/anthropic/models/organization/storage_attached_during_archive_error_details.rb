# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class StorageAttachedDuringArchiveErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :storage_attached_during_archive]
        required :error_code, const: :storage_attached_during_archive

        # @!method initialize(error_code: :storage_attached_during_archive)
        #   The Workspace was archived, but External Storage was attached to it during the
        #   archive and is still attached. To detach it, archive the Workspace again as a
        #   caller with the `org:external-storage:use` permission.
        #
        #   @param error_code [Symbol, :storage_attached_during_archive]
      end
    end
  end
end
