# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaBase64ImageSource < Anthropic::BaseModel
        sig { returns(String) }
        def data
        end

        sig { params(_: String).returns(String) }
        def data=(_)
        end

        sig { returns(Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::OrSymbol) }
        def media_type
        end

        sig do
          params(_: Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::OrSymbol)
            .returns(Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::OrSymbol)
        end
        def media_type=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

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
            T.type_alias { T.any(Symbol, Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol) }

          IMAGE_JPEG =
            T.let(:"image/jpeg", Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol)
          IMAGE_PNG = T.let(:"image/png", Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol)
          IMAGE_GIF = T.let(:"image/gif", Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol)
          IMAGE_WEBP =
            T.let(:"image/webp", Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol)

          class << self
            sig { override.returns(T::Array[Anthropic::Models::Beta::BetaBase64ImageSource::MediaType::TaggedSymbol]) }
            def values
            end
          end
        end
      end
    end

    BetaBase64ImageSource = Beta::BetaBase64ImageSource
  end
end
