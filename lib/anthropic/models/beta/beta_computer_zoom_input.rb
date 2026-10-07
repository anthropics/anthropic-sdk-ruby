# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerZoomInput < Anthropic::Internal::Type::BaseModel
        # @!attribute region
        #   (x0, y0, x1, y1): The region to capture.
        #
        #   @return [Array<Integer>]
        required :region, Anthropic::Internal::Type::ArrayOf[Integer]

        # @!method initialize(region:)
        #   Take a screenshot of a rectangular region. Region coordinates are in the
        #   full-screenshot space (not physical display pixels). The crop is scaled up to
        #   fill the image budget so fine details become legible.
        #
        #   @param region [Array<Integer>] (x0, y0, x1, y1): The region to capture.
      end
    end

    BetaComputerZoomInput = Beta::BetaComputerZoomInput
  end
end
