# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaBase64ImageSource < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :data

        sig { returns(Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::OrSymbol) }
        attr_accessor :media_type

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            data: String,
            media_type: Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::OrSymbol,
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(data:, media_type:, type: :base64)
        end

        sig do
          override
            .returns(
              {data: String, media_type: Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::OrSymbol, type: Symbol}
            )
        end
        def to_hash
        end

        module MediaType
          extend Anthropic::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Models::Beta::BetaBase64ImageSource::MediaType) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol) }

          IMAGE_JPEG =
            T.let(:"image/jpeg", Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol)
          IMAGE_PNG = T.let(:"image/png", Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol)
          IMAGE_GIF = T.let(:"image/gif", Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol)
          IMAGE_WEBP =
            T.let(:"image/webp", Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol)

          sig { override.returns(T::Array[Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end

    BetaBase64ImageSource = Beta::BetaBase64ImageSource
  end
end
