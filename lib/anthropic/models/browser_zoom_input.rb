# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserZoomInput < Anthropic::Internal::Type::BaseModel
      # @!attribute region
      #   [x0, y0, x1, y1] in viewport pixels.
      #
      #   @return [Array<Integer>]
      required :region, Anthropic::Internal::Type::ArrayOf[Integer]

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(region:, tab_id: nil)
      #   Return a cropped screenshot of the given viewport region, scaled up for closer
      #   inspection — useful for small icons, buttons, or text. Coordinates are in the
      #   same viewport-pixel space as a full screenshot.
      #
      #   @param region [Array<Integer>] [x0, y0, x1, y1] in viewport pixels.
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
