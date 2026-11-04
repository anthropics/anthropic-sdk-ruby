# frozen_string_literal: true

module Anthropic
  module Models
    class StorageQuotaExceededErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :storage_quota_exceeded]
      required :error_code, const: :storage_quota_exceeded

      # @!method initialize(error_code: :storage_quota_exceeded)
      #   The organization's file storage quota is exhausted. Delete files to free up
      #   space, then retry the upload.
      #
      #   @param error_code [Symbol, :storage_quota_exceeded]
    end
  end
end
