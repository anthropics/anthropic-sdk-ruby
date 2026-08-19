# typed: strong

module Anthropic
  module Models
    BetaImageBlockParam = Beta::BetaImageBlockParam

    module Beta
      class BetaImageBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaImageBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.any(
              Anthropic::Beta::BetaBase64ImageSource,
              Anthropic::Beta::BetaURLImageSource,
              Anthropic::Beta::BetaFileImageSource
            )
          )
        end
        attr_accessor :source

        sig { returns(Symbol) }
        attr_accessor :type

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        # Configures the transformations the server applies to this image before the model
        # observes it. Each key names a condition the server transforms images for; its
        # value selects the transformation applied. Omitted keys keep their default
        # behavior, and an empty object is equivalent to omitting the field.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaImageTransformationsParam))
        end
        attr_reader :transformations

        sig do
          params(
            transformations:
              T.nilable(Anthropic::Beta::BetaImageTransformationsParam::OrHash)
          ).void
        end
        attr_writer :transformations

        sig do
          params(
            source:
              T.any(
                Anthropic::Beta::BetaBase64ImageSource::OrHash,
                Anthropic::Beta::BetaURLImageSource::OrHash,
                Anthropic::Beta::BetaFileImageSource::OrHash
              ),
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            transformations:
              T.nilable(Anthropic::Beta::BetaImageTransformationsParam::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          source:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # Configures the transformations the server applies to this image before the model
          # observes it. Each key names a condition the server transforms images for; its
          # value selects the transformation applied. Omitted keys keep their default
          # behavior, and an empty object is equivalent to omitting the field.
          transformations: nil,
          type: :image
        )
        end

        sig do
          override.returns(
            {
              source:
                T.any(
                  Anthropic::Beta::BetaBase64ImageSource,
                  Anthropic::Beta::BetaURLImageSource,
                  Anthropic::Beta::BetaFileImageSource
                ),
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              transformations:
                T.nilable(Anthropic::Beta::BetaImageTransformationsParam)
            }
          )
        end
        def to_hash
        end

        module Source
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaBase64ImageSource,
                Anthropic::Beta::BetaURLImageSource,
                Anthropic::Beta::BetaFileImageSource
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaImageBlockParam::Source::Variants]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              data: String,
              media_type:
                Anthropic::Beta::BetaBase64ImageSource::MediaType::OrSymbol,
              url: String,
              file_id: String
            ).returns(Anthropic::Beta::BetaImageBlockParam::Source::Variants)
          end
          def self.new(
            type:,
            data: nil,
            media_type: nil,
            url: nil,
            file_id: nil
          )
          end
        end
      end
    end
  end
end
