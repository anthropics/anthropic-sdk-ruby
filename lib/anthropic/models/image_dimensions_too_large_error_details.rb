# frozen_string_literal: true

module Anthropic
  module Models
    class ImageDimensionsTooLargeErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :image_dimensions_too_large]
      required :error_code, const: :image_dimensions_too_large

      # @!attribute max_side_length_pixels
      #   The limit the images exceeded: the largest width or height, in pixels, that an
      #   image on this request may have.
      #
      #   @return [Integer]
      required :max_side_length_pixels, Integer

      # @!attribute paths
      #   The position of every image over the limit, in the order you sent them, nested
      #   blocks included, such as `messages.0.content.1`, or
      #   `messages.0.content.1.content.0` for an image in a `tool_result` block.
      #
      #   @return [Array<String>]
      required :paths, Anthropic::Internal::Type::ArrayOf[String]

      # @!method initialize(max_side_length_pixels:, paths:, error_code: :image_dimensions_too_large)
      #   The longest side of one or more images in the request exceeds the image size
      #   limit. Scale each image in `paths` so that neither side exceeds
      #   `max_side_length_pixels`, or remove it, then retry.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ImageDimensionsTooLargeErrorDetails} for more details.
      #
      #   @param max_side_length_pixels [Integer] The limit the images exceeded: the largest width or height, in pixels, that an i
      #
      #   @param paths [Array<String>] The position of every image over the limit, in the order you sent them, nested b
      #
      #   @param error_code [Symbol, :image_dimensions_too_large]
    end
  end
end
