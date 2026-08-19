# frozen_string_literal: true

module Anthropic
  module Models
    class ImageTransformationsParam < Anthropic::Internal::Type::BaseModel
      # @!attribute oversized_image
      #   What the server does when this image exceeds the model's maximum image size.
      #   `"downsize"` (the default) scales the image down to fit, which changes the
      #   dimensions the model observes without telling you. `"error"` instead rejects the
      #   request with a 400 error naming the image's dimensions and the largest
      #   dimensions that fit, so you can scale the image deliberately — your image is
      #   never silently scaled down.
      #
      #   @return [Symbol, Anthropic::Models::ImageTransformationsParam::OversizedImage, nil]
      optional :oversized_image, enum: -> { Anthropic::ImageTransformationsParam::OversizedImage }

      # @!method initialize(oversized_image: nil)
      #   Configures the transformations the server applies to this image before the model
      #   observes it. Each key names a condition the server transforms images for; its
      #   value selects the transformation applied. Omitted keys keep their default
      #   behavior, and an empty object is equivalent to omitting the field.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ImageTransformationsParam} for more details.
      #
      #   @param oversized_image [Symbol, Anthropic::Models::ImageTransformationsParam::OversizedImage] What the server does when this image exceeds the model's maximum image size. `"d

      # What the server does when this image exceeds the model's maximum image size.
      # `"downsize"` (the default) scales the image down to fit, which changes the
      # dimensions the model observes without telling you. `"error"` instead rejects the
      # request with a 400 error naming the image's dimensions and the largest
      # dimensions that fit, so you can scale the image deliberately — your image is
      # never silently scaled down.
      #
      # @see Anthropic::Models::ImageTransformationsParam#oversized_image
      module OversizedImage
        extend Anthropic::Internal::Type::Enum

        DOWNSIZE = :downsize
        ERROR = :error

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
