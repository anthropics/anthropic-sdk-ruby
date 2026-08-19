# typed: strong

module Anthropic
  module Models
    class ImageTransformationsParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ImageTransformationsParam,
            Anthropic::Internal::AnyHash
          )
        end

      # What the server does when this image exceeds the model's maximum image size.
      # `"downsize"` (the default) scales the image down to fit, which changes the
      # dimensions the model observes without telling you. `"error"` instead rejects the
      # request with a 400 error naming the image's dimensions and the largest
      # dimensions that fit, so you can scale the image deliberately — your image is
      # never silently scaled down.
      sig do
        returns(
          T.nilable(
            Anthropic::ImageTransformationsParam::OversizedImage::OrSymbol
          )
        )
      end
      attr_reader :oversized_image

      sig do
        params(
          oversized_image:
            Anthropic::ImageTransformationsParam::OversizedImage::OrSymbol
        ).void
      end
      attr_writer :oversized_image

      # Configures the transformations the server applies to this image before the model
      # observes it. Each key names a condition the server transforms images for; its
      # value selects the transformation applied. Omitted keys keep their default
      # behavior, and an empty object is equivalent to omitting the field.
      sig do
        params(
          oversized_image:
            Anthropic::ImageTransformationsParam::OversizedImage::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # What the server does when this image exceeds the model's maximum image size.
        # `"downsize"` (the default) scales the image down to fit, which changes the
        # dimensions the model observes without telling you. `"error"` instead rejects the
        # request with a 400 error naming the image's dimensions and the largest
        # dimensions that fit, so you can scale the image deliberately — your image is
        # never silently scaled down.
        oversized_image: nil
      )
      end

      sig do
        override.returns(
          {
            oversized_image:
              Anthropic::ImageTransformationsParam::OversizedImage::OrSymbol
          }
        )
      end
      def to_hash
      end

      # What the server does when this image exceeds the model's maximum image size.
      # `"downsize"` (the default) scales the image down to fit, which changes the
      # dimensions the model observes without telling you. `"error"` instead rejects the
      # request with a 400 error naming the image's dimensions and the largest
      # dimensions that fit, so you can scale the image deliberately — your image is
      # never silently scaled down.
      module OversizedImage
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::ImageTransformationsParam::OversizedImage)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DOWNSIZE =
          T.let(
            :downsize,
            Anthropic::ImageTransformationsParam::OversizedImage::TaggedSymbol
          )
        ERROR =
          T.let(
            :error,
            Anthropic::ImageTransformationsParam::OversizedImage::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::ImageTransformationsParam::OversizedImage::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
