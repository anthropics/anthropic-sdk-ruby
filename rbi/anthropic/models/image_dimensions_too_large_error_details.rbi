# typed: strong

module Anthropic
  module Models
    class ImageDimensionsTooLargeErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ImageDimensionsTooLargeErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The limit the images exceeded: the largest width or height, in pixels, that an
      # image on this request may have.
      sig { returns(Integer) }
      attr_accessor :max_side_length_pixels

      # The position of every image over the limit, in the order you sent them, nested
      # blocks included, such as `messages.0.content.1`, or
      # `messages.0.content.1.content.0` for an image in a `tool_result` block.
      sig { returns(T::Array[String]) }
      attr_accessor :paths

      # The longest side of one or more images in the request exceeds the image size
      # limit. Scale each image in `paths` so that neither side exceeds
      # `max_side_length_pixels`, or remove it, then retry.
      sig do
        params(
          max_side_length_pixels: Integer,
          paths: T::Array[String],
          error_code: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The limit the images exceeded: the largest width or height, in pixels, that an
        # image on this request may have.
        max_side_length_pixels:,
        # The position of every image over the limit, in the order you sent them, nested
        # blocks included, such as `messages.0.content.1`, or
        # `messages.0.content.1.content.0` for an image in a `tool_result` block.
        paths:,
        error_code: :image_dimensions_too_large
      )
      end

      sig do
        override.returns(
          {
            error_code: Symbol,
            max_side_length_pixels: Integer,
            paths: T::Array[String]
          }
        )
      end
      def to_hash
      end
    end
  end
end
