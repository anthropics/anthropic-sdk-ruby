# typed: strong

module Anthropic
  module Models
    class StorageQuotaExceededErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::StorageQuotaExceededErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The organization's file storage quota is exhausted. Delete files to free up
      # space, then retry the upload.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :storage_quota_exceeded)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
