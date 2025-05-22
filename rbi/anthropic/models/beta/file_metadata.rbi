# typed: strong

module Anthropic
  module Models
    module Beta
      class FileMetadata < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::FileMetadata, Anthropic::Internal::AnyHash)
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

        sig do
          params(
            id: String,
            created_at: Time,
            filename: String,
            mime_type: String,
            size_bytes: Integer,
            downloadable: T::Boolean,
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
              downloadable: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
