# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserScrollInput < Anthropic::Internal::Type::BaseModel
      # @!attribute scroll_direction
      #
      #   @return [Symbol, Anthropic::Models::BrowserScrollDirection]
      required :scroll_direction, enum: -> { Anthropic::BrowserScrollDirection }

      # @!attribute target
      #   A point in the browser viewport, in viewport pixels (the same frame as a
      #   full-viewport screenshot).
      #
      #   @return [Anthropic::Models::BrowserCoordinateTarget]
      required :target, -> { Anthropic::BrowserCoordinateTarget }

      # @!attribute scroll_amount
      #   Scroll-wheel notches (1–10). Default 3.
      #
      #   @return [Integer, nil]
      optional :scroll_amount, Integer, nil?: true

      # @!attribute tab_id
      #   Tab to act on. Defaults to the active tab when omitted.
      #
      #   @return [String, nil]
      optional :tab_id, String, nil?: true

      # @!method initialize(scroll_direction:, target:, scroll_amount: nil, tab_id: nil)
      #   Scroll at a viewport position. `target` must be a coordinate target.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserScrollInput} for more details.
      #
      #   @param scroll_direction [Symbol, Anthropic::Models::BrowserScrollDirection]
      #
      #   @param target [Anthropic::Models::BrowserCoordinateTarget] A point in the browser viewport, in viewport pixels (the same frame as a
      #
      #   @param scroll_amount [Integer, nil] Scroll-wheel notches (1–10). Default 3.
      #
      #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
    end
  end
end
