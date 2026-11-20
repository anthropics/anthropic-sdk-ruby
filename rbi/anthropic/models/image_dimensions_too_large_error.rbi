# typed: strong

module Anthropic
  module Models
    # The longest side of one or more images in the request exceeds the image size
    # limit. Scale each image in `paths` so that neither side exceeds
    # `max_side_length_pixels`, or remove it, then retry.
    class ImageDimensionsTooLargeError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ImageDimensionsTooLargeErrorDetails) }
      def details
      end
    end
  end
end
