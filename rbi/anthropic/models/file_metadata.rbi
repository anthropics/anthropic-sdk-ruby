# typed: strong

module Anthropic
  module Models
    class FileMetadata < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::FileMetadata, Anthropic::Internal::AnyHash)
        end

      # Unique object identifier.
      #
      # The format and length of IDs may change over time.
      sig { returns(String) }
      attr_accessor :id

      # RFC 3339 datetime string representing when the file was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # Original filename of the uploaded file.
      sig { returns(String) }
      attr_accessor :filename

      # MIME type of the file.
      sig { returns(String) }
      attr_accessor :mime_type

      # Size of the file in bytes.
      sig { returns(Integer) }
      attr_accessor :size_bytes

      # Object type.
      #
      # For files, this is always `"file"`.
      sig { returns(Symbol) }
      attr_accessor :type

      # Whether the file can be downloaded.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :downloadable

      sig { params(downloadable: T::Boolean).void }
      attr_writer :downloadable

      # RFC 3339 datetime string representing when the file will expire and become
      # unavailable for download. Null if the file does not expire. For files uploaded
      # with `expires_in_seconds`, this is the upload time plus that value.
      sig { returns(T.nilable(Time)) }
      attr_accessor :expires_at

      sig do
        params(
          id: String,
          created_at: Time,
          filename: String,
          mime_type: String,
          size_bytes: Integer,
          downloadable: T::Boolean,
          expires_at: T.nilable(Time),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique object identifier.
        #
        # The format and length of IDs may change over time.
        id:,
        # RFC 3339 datetime string representing when the file was created.
        created_at:,
        # Original filename of the uploaded file.
        filename:,
        # MIME type of the file.
        mime_type:,
        # Size of the file in bytes.
        size_bytes:,
        # Whether the file can be downloaded.
        downloadable: nil,
        # RFC 3339 datetime string representing when the file will expire and become
        # unavailable for download. Null if the file does not expire. For files uploaded
        # with `expires_in_seconds`, this is the upload time plus that value.
        expires_at: nil,
        # Object type.
        #
        # For files, this is always `"file"`.
        type: :file
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            filename: String,
            mime_type: String,
            size_bytes: Integer,
            type: Symbol,
            downloadable: T::Boolean,
            expires_at: T.nilable(Time)
          }
        )
      end
      def to_hash
      end
    end
  end
end
