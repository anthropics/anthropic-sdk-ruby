# frozen_string_literal: true

module Anthropic
  module Models
    # The longest side of one or more images in the request exceeds the image size
    # limit. Scale each image in `paths` so that neither side exceeds
    # `max_side_length_pixels`, or remove it, then retry.
    class ImageDimensionsTooLargeError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :image_dimensions_too_large]

      # @return [Anthropic::Models::ImageDimensionsTooLargeErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ImageDimensionsTooLargeErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
