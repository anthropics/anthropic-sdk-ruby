# typed: strong

module Anthropic
  module Models
    # The organization's file storage quota is exhausted. Delete files to free up
    # space, then retry the upload.
    class StorageQuotaExceededError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::StorageQuotaExceededErrorDetails) }
      def details
      end
    end
  end
end
