# typed: strong

module Anthropic
  module Models
    module Beta
      class DeletedFile < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::DeletedFile, Anthropic::Internal::AnyHash)
          end

        # ID of the deleted file.
        sig { returns(String) }
        attr_accessor :id

        # Deleted object type.
        #
        # For file deletion, this is always `"file_deleted"`.
        sig do
          returns(T.nilable(Anthropic::Beta::DeletedFile::Type::TaggedSymbol))
        end
        attr_reader :type

        sig { params(type: Anthropic::Beta::DeletedFile::Type::OrSymbol).void }
        attr_writer :type

        sig do
          params(
            id: String,
            type: Anthropic::Beta::DeletedFile::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the deleted file.
          id:,
          # Deleted object type.
          #
          # For file deletion, this is always `"file_deleted"`.
          type: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              type: Anthropic::Beta::DeletedFile::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Deleted object type.
        #
        # For file deletion, this is always `"file_deleted"`.
        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Anthropic::Beta::DeletedFile::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FILE_DELETED =
            T.let(
              :file_deleted,
              Anthropic::Beta::DeletedFile::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::DeletedFile::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
