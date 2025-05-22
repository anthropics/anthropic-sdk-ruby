# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Files#list
      class FileMetadata < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Unique object identifier.
        #
        #   The format and length of IDs may change over time.
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #   RFC 3339 datetime string representing when the file was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute filename
        #   Original filename of the uploaded file.
        #
        #   @return [String]
        required :filename, String

        # @!attribute mime_type
        #   MIME type of the file.
        #
        #   @return [String]
        required :mime_type, String

        # @!attribute size_bytes
        #   Size of the file in bytes.
        #
        #   @return [Integer]
        required :size_bytes, Integer

        # @!attribute type
        #   Object type.
        #
        #   For files, this is always `"file"`.
        #
        #   @return [Symbol, :file]
        required :type, const: :file

        # @!attribute downloadable
        #   Whether the file can be downloaded.
        #
        #   @return [Boolean, nil]
        optional :downloadable, Anthropic::Internal::Type::Boolean

        # @!method initialize(id:, created_at:, filename:, mime_type:, size_bytes:, downloadable: nil, type: :file)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::FileMetadata} for more details.
        #
        #   @param id [String] Unique object identifier.
        #
        #   @param created_at [Time] RFC 3339 datetime string representing when the file was created.
        #
        #   @param filename [String] Original filename of the uploaded file.
        #
        #   @param mime_type [String] MIME type of the file.
        #
        #   @param size_bytes [Integer] Size of the file in bytes.
        #
        #   @param downloadable [Boolean] Whether the file can be downloaded.
        #
        #   @param type [Symbol, :file] Object type.
      end
    end
  end
end
