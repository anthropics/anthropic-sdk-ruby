# typed: strong

module Anthropic
  module Models
    class Base64ImageSource < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::Base64ImageSource, Anthropic::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :data

      sig { returns(Anthropic::Base64ImageSource::MediaType::OrSymbol) }
      attr_accessor :media_type

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          data: String,
          media_type: Anthropic::Base64ImageSource::MediaType::OrSymbol,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(data:, media_type:, type: :base64)
      end

      sig do
        override.returns(
          {
            data: String,
            media_type: Anthropic::Base64ImageSource::MediaType::OrSymbol,
            type: Symbol
          }
        )
      end
      def to_hash
      end

      module MediaType
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Base64ImageSource::MediaType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        IMAGE_JPEG =
          T.let(
            :"image/jpeg",
            Anthropic::Base64ImageSource::MediaType::TaggedSymbol
          )
        IMAGE_PNG =
          T.let(
            :"image/png",
            Anthropic::Base64ImageSource::MediaType::TaggedSymbol
          )
        IMAGE_GIF =
          T.let(
            :"image/gif",
            Anthropic::Base64ImageSource::MediaType::TaggedSymbol
          )
        IMAGE_WEBP =
          T.let(
            :"image/webp",
            Anthropic::Base64ImageSource::MediaType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::Base64ImageSource::MediaType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
