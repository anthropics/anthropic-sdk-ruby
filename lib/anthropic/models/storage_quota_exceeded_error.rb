# frozen_string_literal: true

module Anthropic
  module Models
    # The organization's file storage quota is exhausted. Delete files to free up
    # space, then retry the upload.
    class StorageQuotaExceededError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :storage_quota_exceeded]

      # @return [Anthropic::Models::StorageQuotaExceededErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::StorageQuotaExceededErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
