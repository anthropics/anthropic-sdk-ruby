# typed: strong

module Anthropic
  module Models
    BetaBase64ImageSource = Beta::BetaBase64ImageSource

    module Beta
      class BetaBase64ImageSource < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBase64ImageSource,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :data

        sig do
          returns(Anthropic::Beta::BetaBase64ImageSource::MediaType::OrSymbol)
        end
        attr_accessor :media_type

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            data: String,
            media_type:
              Anthropic::Beta::BetaBase64ImageSource::MediaType::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(data:, media_type:, type: :base64)
        end

        sig do
          override.returns(
            {
              data: String,
              media_type:
                Anthropic::Beta::BetaBase64ImageSource::MediaType::OrSymbol,
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
              T.all(Symbol, Anthropic::Beta::BetaBase64ImageSource::MediaType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IMAGE_JPEG =
            T.let(
              :"image/jpeg",
              Anthropic::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol
            )
          IMAGE_PNG =
            T.let(
              :"image/png",
              Anthropic::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol
            )
          IMAGE_GIF =
            T.let(
              :"image/gif",
              Anthropic::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol
            )
          IMAGE_WEBP =
            T.let(
              :"image/webp",
              Anthropic::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
