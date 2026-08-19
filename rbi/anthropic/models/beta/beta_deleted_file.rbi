# typed: strong

module Anthropic
  module Models
    BetaDeletedFile = Beta::BetaDeletedFile

    module Beta
      class BetaDeletedFile < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDeletedFile,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the deleted file.
        sig { returns(String) }
        attr_accessor :id

        # Deleted object type.
        #
        # For file deletion, this is always `"file_deleted"`.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaDeletedFile::Type::TaggedSymbol)
          )
        end
        attr_reader :type

        sig do
          params(type: Anthropic::Beta::BetaDeletedFile::Type::OrSymbol).void
        end
        attr_writer :type

        sig do
          params(
            id: String,
            type: Anthropic::Beta::BetaDeletedFile::Type::OrSymbol
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
              type: Anthropic::Beta::BetaDeletedFile::Type::TaggedSymbol
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
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaDeletedFile::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FILE_DELETED =
            T.let(
              :file_deleted,
              Anthropic::Beta::BetaDeletedFile::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaDeletedFile::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
