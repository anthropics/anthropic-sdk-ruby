# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserCoordinateTarget < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :coordinate]
      required :type, const: :coordinate

      # @!attribute x
      #   Pixels from the left edge of the viewport.
      #
      #   @return [Integer]
      required :x, Integer

      # @!attribute y_
      #   Pixels from the top edge of the viewport.
      #
      #   @return [Integer]
      required :y_, Integer, api_name: :y

      # @!method initialize(x:, y_:, type: :coordinate)
      #   A point in the browser viewport, in viewport pixels (the same frame as a
      #   full-viewport screenshot).
      #
      #   @param x [Integer] Pixels from the left edge of the viewport.
      #
      #   @param y_ [Integer] Pixels from the top edge of the viewport.
      #
      #   @param type [Symbol, :coordinate]
    end
  end
end
