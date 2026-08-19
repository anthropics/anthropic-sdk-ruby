# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Files#delete
    class DeletedFile < Anthropic::Internal::Type::BaseModel
      # @!attribute id
      #   ID of the deleted file.
      #
      #   @return [String]
      required :id, String

      # @!attribute type
      #   Deleted object type.
      #
      #   For file deletion, this is always `"file_deleted"`.
      #
      #   @return [Symbol, Anthropic::Models::DeletedFile::Type, nil]
      optional :type, enum: -> { Anthropic::DeletedFile::Type }

      # @!method initialize(id:, type: nil)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::DeletedFile} for more details.
      #
      #   @param id [String] ID of the deleted file.
      #
      #   @param type [Symbol, Anthropic::Models::DeletedFile::Type] Deleted object type.

      # Deleted object type.
      #
      # For file deletion, this is always `"file_deleted"`.
      #
      # @see Anthropic::Models::DeletedFile#type
      module Type
        extend Anthropic::Internal::Type::Enum

        FILE_DELETED = :file_deleted

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
