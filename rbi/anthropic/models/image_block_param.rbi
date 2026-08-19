# typed: strong

module Anthropic
  module Models
    class ImageBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ImageBlockParam, Anthropic::Internal::AnyHash)
        end

      sig do
        returns(
          T.any(
            Anthropic::Base64ImageSource,
            Anthropic::URLImageSource,
            Anthropic::FileImageSource
          )
        )
      end
      attr_accessor :source

      sig { returns(Symbol) }
      attr_accessor :type

      # Create a cache control breakpoint at this content block.
      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      # Configures the transformations the server applies to this image before the model
      # observes it. Each key names a condition the server transforms images for; its
      # value selects the transformation applied. Omitted keys keep their default
      # behavior, and an empty object is equivalent to omitting the field.
      sig { returns(T.nilable(Anthropic::ImageTransformationsParam)) }
      attr_reader :transformations

      sig do
        params(
          transformations:
            T.nilable(Anthropic::ImageTransformationsParam::OrHash)
        ).void
      end
      attr_writer :transformations

      sig do
        params(
          source:
            T.any(
              Anthropic::Base64ImageSource::OrHash,
              Anthropic::URLImageSource::OrHash,
              Anthropic::FileImageSource::OrHash
            ),
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          transformations:
            T.nilable(Anthropic::ImageTransformationsParam::OrHash),
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
                Anthropic::Base64ImageSource,
                Anthropic::URLImageSource,
                Anthropic::FileImageSource
              ),
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            transformations: T.nilable(Anthropic::ImageTransformationsParam)
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
              Anthropic::Base64ImageSource,
              Anthropic::URLImageSource,
              Anthropic::FileImageSource
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::ImageBlockParam::Source::Variants]
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
            media_type: Anthropic::Base64ImageSource::MediaType::OrSymbol,
            url: String,
            file_id: String
          ).returns(Anthropic::ImageBlockParam::Source::Variants)
        end
        def self.new(type:, data: nil, media_type: nil, url: nil, file_id: nil)
        end
      end
    end
  end
end
